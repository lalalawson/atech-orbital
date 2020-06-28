import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purrductive/todolistpage/labels/label.dart';
import 'dart:collection';

class LabelData extends ChangeNotifier {
  List<Labels> _labels = [];

  UnmodifiableListView<Labels> get labels {
    return UnmodifiableListView(_labels);
  }

  List<Labels> get listLabels {
    return _labels;
  }

  int get labelCount {
    return _labels.length;
  }

  bool get isEmpty {
    return this.labelCount == 0;
  }

  void addTask(String name, Icon icon, Color color) {
    final label = Labels(
      name: name,
      color: color,
      icon: icon,
    );
    _labels.add(label);
    notifyListeners();
  }

  void deleteTask(Labels label) {
    _labels.remove(label);
    notifyListeners();
  }
}
