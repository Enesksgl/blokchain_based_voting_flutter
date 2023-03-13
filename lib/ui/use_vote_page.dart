import 'package:flutter/material.dart';

import '../common/block_chain.dart';

class UseVotePage extends StatefulWidget {
  const UseVotePage({Key? key}) : super(key: key);

  @override
  State<UseVotePage> createState() => _UseVotePageState();
}

class _UseVotePageState extends State<UseVotePage> {
  BlockChain? blockChain;

  @override
  void initState() {
    super.initState();
    blockChain = BlockChain();
  }

  @override
  Widget build(BuildContext context) {
    if (blockChain!.chain.isEmpty) {
      setState(() {});
      return const CircularProgressIndicator();
    } else {
      return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: const Text("Seçim Adı")),
        body: Column(
          children: [
            ElevatedButton(onPressed: () => setState(() => blockChain!.addBlock("data")), child: const Text("Blok Ekle")),
            Flexible(
              child: ListView.builder(
                  itemCount: blockChain!.chain.length,
                  itemBuilder: (BuildContext context, index) => Card(
                        child: Text(
                          blockChain!.chain[index].toString(),
                        ),
                      )),
            ),
          ],
        ),
      );
    }
  }
}
