import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';
import 'package:flutter/cupertino.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    String newRemarks;
    DateTime dateTime = DateTime.now();
    bool isChanged = false;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  hintText: "Enter Task to be done",
                  hintStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
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
              TextField(
                decoration: InputDecoration(
                  hintText: "Additional Information",
                  hintStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
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
                  newRemarks = newText;
                },
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.calendar_today,
                  size: 25,
                ),
                title: Text(
                  "Pick a date",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PixelOperator',
                    color: greenblue,
                    fontSize: 25,
                  ),
                ),
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        isChanged = true;
                        dateTime = newDate;
                      },
                      mode: CupertinoDatePickerMode.date,
                      maximumDate: new DateTime(2099, 12, 30),
                      minimumYear: 2020,
                      maximumYear: 2099,
                    ),
                  )
                ],
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  if (newTaskTitle != null) {
                    if (newRemarks == null) {
                      Provider.of<TaskData>(context)
                          .addTask(newTaskTitle, '', dateTime);
                    } else {
                      Provider.of<TaskData>(context)
                          .addTask(newTaskTitle, newRemarks, dateTime);
                    }
                  }
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                      fontFamily: 'pixelsix',
                      fontSize: 30,
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: yellow,
              ),
            ],
          )),
    );
  }
}
