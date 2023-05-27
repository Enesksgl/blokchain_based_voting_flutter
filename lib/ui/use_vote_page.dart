import 'package:blokchain_based_voiting/common/api.dart';
import 'package:blokchain_based_voiting/common/voting.dart';
import 'package:flutter/material.dart';

import '../common/block.dart';
import '../common/block_chain.dart';

class UseVotePage extends StatefulWidget {
  final Voting voting;

  const UseVotePage({Key? key, required this.voting}) : super(key: key);

  @override
  State<UseVotePage> createState() => _UseVotePageState();
}

class _UseVotePageState extends State<UseVotePage> {
  Block? block;
  String? vote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.voting.name)),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => ApiService().getLastBlock(widget.voting.id).then((value) {
                    block = value!;
                    setState(() {});
                  }),
              child: const Text("Son Block")),
          Card(child: Text(block != null ? block.toString() : "")),
          Column(
              children: widget.voting.options
                  .map((o) => InkWell(
                        onTap: () {
                          setState(() {
                            vote = o;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Card(
                            child: Center(
                              child: Text(
                                o,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: vote == o ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            color: vote == o ? Colors.blue : Colors.white60,
                          ),
                        ),
                      ))
                  .toList()),
          ElevatedButton(
              onPressed: vote != null
                  ? () => ApiService().addBlock(vote!, widget.voting.id).then((value) {
                        setState(() {});
                      })
                  : null,
              child: const Text("Oyunu Gönder")),
        ],
      ),
    );
  }
}
