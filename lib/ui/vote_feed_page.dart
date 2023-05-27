import 'package:blokchain_based_voiting/common/api.dart';
import 'package:blokchain_based_voiting/ui/use_vote_page.dart';
import 'package:flutter/material.dart';

import '../common/voting.dart';

class VoteFeedPage extends StatefulWidget {
  const VoteFeedPage({Key? key}) : super(key: key);

  @override
  State<VoteFeedPage> createState() => _VoteFeedPageState();
}

class _VoteFeedPageState extends State<VoteFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Seçimlerim")),
        body: FutureBuilder(
            future: ApiService().getVotingList(),
            builder: (BuildContext context, AsyncSnapshot<List<Voting>?> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return ListView(
                    children: snapshot.data!
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.grey.shade200,
                                elevation: 15,
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height / 12,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.access_alarm),
                                        Column(
                                          children: [Text(e.name, style: TextStyle(fontSize: 20)), Text("${e.startDate} - ${e.endDate}")],
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UseVotePage(voting: e)));
                                            },
                                            child: const Text("Katıl"))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                } else {
                  return Center(child: Text("Katılacağınız seçim yok."));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
