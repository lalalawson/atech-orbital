import 'package:flutter/material.dart';
import 'package:flutter_list_drag_and_drop/drag_and_drop_list.dart';
import 'package:purrductive/todolistpage/labels/labelCircle.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/labels/label.dart';
import 'package:purrductive/todolistpage/labels/labelData.dart';

class LabelList extends StatefulWidget {
  @override
  _LabelListState createState() => _LabelListState();
}

class _LabelListState extends State<LabelList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LabelData>(
      builder: (context, labelData, child) {
        List<Labels> listLabels = labelData.listLabels;
        return ListView.builder(
          itemBuilder: (context, index) {
            final label = labelData.labels[index];
            return LabelCircle(
              key: UniqueKey(),
              name: label.name,
              color: label.color,
              icon: label.icon,
            );
          },
        );
      },
    );
  }
}
