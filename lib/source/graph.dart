import 'package:graph_dot/graph_dot.dart';

class Graph {
  String name;

  final Map<String, String> _nodes = {};
  final List<({String a, String b, String label})> _edges = [];

  Graph({this.name = "MyGraph"});

  factory Graph.parseTree(ITree node, [String name = "Tree"])
  {
    var graph = Graph(name: name);

    graph.setNode(node.hashCode.toString(), label: node.getLabel());

    for (var nodeChild in node.getChilds()) {
      final treeChild = Graph.parseTree(nodeChild);
      graph.setEdge(node.hashCode.toString(), nodeChild.hashCode.toString());
      graph._nodes.addAll(treeChild._nodes);
      graph._edges.addAll(treeChild._edges);
    }

    return graph;
  }

  Graph setNode(String node, {String label = ""}) {
    _nodes[node] = label;
    return this;
  }

  Graph setEdge(String a, String b, {String label = ""}) {
    for (var i = 0; i < _edges.length; i++) {
      if (_edges[i].a == a && _edges[i].b == b) {
        _edges[i] = (a: a, b: b, label: label);
        return this;
      }
    }
    _edges.add((a: a, b: b, label: label));
    return this;
  }

  String toDot() {
    String res = "digraph $name {";

    _nodes.forEach((key, value) {
      res += '\n    $key [label="$value"]';
    });

    _edges.forEach((elem) {
      res += '\n    ${elem.a} -> ${elem.b} [label="${elem.label}"]';
    });

    res += "\n}";
    return res;
  }
}