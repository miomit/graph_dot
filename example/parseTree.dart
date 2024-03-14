import 'dart:io';

import 'package:graph_dot/graph_dot.dart';

class Node implements ITree{
  String name;

  List<Node> childs;

  Node(this.name, this.childs);

  @override
  List<ITree> getChilds() {
    return childs;
  }
  
  @override
  String getLabel() {
    return name;
  }
}

void main() {
  var a = Node(
    "Y",
    [
      Node("B", [Node("E", []), Node("F", [])]),
      Node("C", [Node("D", [])]),
    ]
  );

  var g = Graph.parseTree(a);

  File newFile = File("./test.dot");

  newFile.writeAsStringSync(g.toDot());

  Process.runSync("dot", ["-Tpng", "-Gdpi=300", "test.dot", "-o", "test.png"]);
}
