import 'block.dart';

class BlockChain {
  List<Block> chain = [];

   BlockChain() {
    chain.add(createGenesis());
  }

  Block createGenesis() => Block(timeStamp: DateTime.now(), data: "Genesis");

  void addBlock(data) => chain.add(Block(timeStamp: DateTime.now(), data: data, previousHash: chain.last.hash));
}
