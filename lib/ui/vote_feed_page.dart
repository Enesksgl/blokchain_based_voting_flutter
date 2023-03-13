import 'package:blokchain_based_voiting/common/block_chain.dart';
import 'package:blokchain_based_voiting/ui/use_vote_page.dart';
import 'package:flutter/material.dart';

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
        body: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, index) {
              return Padding(
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
                          const Text("Seçim Adı", style: TextStyle(fontSize: 20)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UseVotePage()));
                              },
                              child: const Text("Katıl"))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
