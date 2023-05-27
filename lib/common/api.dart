import 'dart:convert';
import 'package:blokchain_based_voiting/common/block.dart';
import 'package:blokchain_based_voiting/common/voting.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _instance = ApiService._internal();

  static String jwt = "";

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    // initialization logic
  }

  var baseURL = 'http://192.168.0.14:5000';

  Future<bool> login(String tc, password) async {
    //TODO: Password hashle ve o şekilde backende gönder
    var response = await http.post(Uri.parse('$baseURL/api/login'), body: {'tc': tc, 'password': password});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      jwt = jsonResponse["token"];
      print(jwt);
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      jwt = "unauthorized";
      return false;
    }
  }

  Future<Block?> getLastBlock(int votingId) async {
    var response = await http.get(Uri.parse('$baseURL/api/lastBlock/$votingId'), headers: {"Authorization": jwt});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return Block.withHash(DateTime.parse(jsonResponse["timestamp"]), jsonResponse["data"], jsonResponse["previousHash"], jsonResponse["hash"]);
    } else {
      print('Request failed with status: ${response.statusCode}. ${response.body}');
      return null;
    }
  }

  Future<bool> addBlock(String data, int votingId) async {
    //TODO: Data hashle
    var response = await http.post(Uri.parse('$baseURL/api/addBlock'), headers: {"Authorization": jwt}, body: {"vote": data, "votingId": votingId.toString()});
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }

  Future<List<Voting>?> getVotingList() async {
    var response = await http.get(Uri.parse('$baseURL/api/getVotingList'), headers: {"Authorization": jwt});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return (jsonResponse["voting"] as List).map<Voting>((v) => Voting.fromJson(v)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}. ${response.body}');
      return null;
    }
  }
}
