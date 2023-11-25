Library for creating Graphviz graphs in the dot language.

![example](https://github.com/yuraMovsesyan/graph_dot/blob/main/assets/example.png?raw=true)

## Getting started

Add a dependency to `pubspec.yaml`

```yaml
dependencies:
    graph_dot:
```

you will also need the **graphviz** utility.

Fedora
```
sudo dnf install graphviz
```

## Usage

Look in `/example` folder.

```dart
var graph = Graph();

graph.setEdge('A', 'B');

print(graph.toDot);
```

## Additional information

This library is under development. With each new version, a new feature will be added.
