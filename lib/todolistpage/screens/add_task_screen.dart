import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: silverwhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'New Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PixelOperator',
                  color: greenblue,
                  fontSize: 60,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenblue),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenblue),
                  ),
                ),
                autofocus: true, //auto keyboard come out
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'pixelmix',
                  fontSize: 18,
                ),
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              FlatButton(
                onPressed: () {
                  if (newTaskTitle != null) {
                    Provider.of<TaskData>(context).addTask(newTaskTitle);
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    fontFamily: 'pixelsix',
                    fontSize: 30,
                    letterSpacing: 3,
                    color: Colors.white,
                  ),
                ),
                color: yellow,
              ),
            ],
          )),
    );
  }
}
