import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  Color midProgress = yellow;
  Color startProgress = red;
  Color endProgress = cyan;

  @override
  Widget build(BuildContext context) {
    String progress =
        (Provider.of<TaskData>(context).progress * 100).toStringAsFixed(1);

    bool progressFull() {
      return Provider.of<TaskData>(context).progress == 1;
    }

    AlwaysStoppedAnimation<Color> progressColor() {
      double p = Provider.of<TaskData>(context).progress;
      if (p < 0.33) {
        return AlwaysStoppedAnimation<Color>(startProgress);
      } else if (p < 0.99) {
        return AlwaysStoppedAnimation<Color>(midProgress);
      } else {
        return AlwaysStoppedAnimation<Color>(endProgress);
      }
    }

    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: LinearProgressIndicator(
            value: Provider.of<TaskData>(context).progress,
            backgroundColor: Colors.grey,
            valueColor: progressColor(),
          ),
        ),
        Expanded(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: GestureDetector(
              onTap: () {
                if (progressFull()) {
                  Provider.of<TaskData>(context).clearTasks();
                  setState(
                    () {},
                  );
                }
              },
              child: Text(
                progressFull()
                    ? "Tasks Completed!\nTap here to clear tasks"
                    : "Your progress: $progress%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'pixelmix',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
