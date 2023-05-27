import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Block {
  DateTime timeStamp;
  String data;
  String? previousHash;
  int force = 0;
  String? hash;

  Block({required this.timeStamp, required this.data, this.previousHash}) {
    hash = calculate(data, previousHash, timeStamp);
  }

  Block.withHash(DateTime ts, String dt, String ph,String h):
    timeStamp=ts,
    previousHash=ph,
    data =dt,
    hash =h;


  String calculate(String data, previousHash, DateTime timeStamp) {
    String sum;
    while (true) {
      force++;
      var blockData = timeStamp.toIso8601String() + data + (previousHash ?? "") + force.toString();
      sum = sha256.convert(utf8.encode(blockData)).toString();
      if (sum.characters.elementAt(0) == "0" && sum.characters.elementAt(1) == "0") {
        break;
      }
    }

    return sum;
  }

  @override
  String toString() {
    print("${timeStamp.toIso8601String()} \n $data \n $previousHash \n $force \n $hash");
    return "${timeStamp.toIso8601String()} \n $data \n $previousHash \n $force \n $hash";
  }
}
