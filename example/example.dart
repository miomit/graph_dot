import 'dart:io';

import 'package:graph_dot/graph_dot.dart';

void main() {
  var graph = Graph();

  graph.setNode('A', label: 'Node 1');
  graph.setNode('B', label: 'B');
  graph.setNode('C', label: 'C');

  graph.setEdge('A', 'B');
  graph.setEdge('B', 'C', label: 'Edge');
  graph.setEdge('C', 'A', label: 'POP');

  File newFile = File("./test.dot");

  newFile.writeAsStringSync(graph.toDot());

  Process.runSync("dot", ["-Tpng", "-Gdpi=300", "test.dot", "-o", "test.png"]);
}