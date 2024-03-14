import 'package:graph_dot/graph_dot.dart';

class Graph {
  String name;

  Map<String, String> nodes = {};
  List<({String a, String b, String label})> edges = [];

  Graph({this.name = "MyGraph"});

  factory Graph.parseTree(ITree node, [String name = "Tree"])
  {
    var graph = Graph(name: name);

    graph.setNode(node.hashCode.toString(), label: node.getLabel());

    for (var nodeChild in node.getChilds()) {
      final treeChild = Graph.parseTree(nodeChild);
      graph.setEdge(node.hashCode.toString(), nodeChild.hashCode.toString());
      graph.nodes.addAll(treeChild.nodes);
      graph.edges.addAll(treeChild.edges);
    }

    return graph;
  }

  Graph setNode(String node, {String label = ""}) {
    nodes[node] = label;
    return this;
  }

  Graph setEdge(String a, String b, {String label = ""}) {
    for (var i = 0; i < edges.length; i++) {
      if (edges[i].a == a && edges[i].b == b) {
        edges[i] = (a: a, b: b, label: label);
        return this;
      }
    }
    edges.add((a: a, b: b, label: label));
    return this;
  }

  String toDot() {
    String res = "digraph $name {";

    nodes.forEach((key, value) {
      res += '\n    $key [label="$value"]';
    });

    edges.forEach((elem) {
      res += '\n    ${elem.a} -> ${elem.b} [label="${elem.label}"]';
    });

    res += "\n}";
    return res;
  }
}