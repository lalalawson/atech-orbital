import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';
import 'package:flutter/cupertino.dart';
import 'package:two_letter_icon/two_letter_icon.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool labelSelected = false;
  bool redLabel = false;
  bool blueLabel = false;
  bool yellowLabel = false;
  bool greenLabel = false;
  bool cyanLabel = false;
  Color colorSelected;
  String newTaskTitle;

  @override
  void initState() {
    setState(() {
      labelSelected = false;
      redLabel = false;
      blueLabel = false;
      yellowLabel = false;
      greenLabel = false;
      cyanLabel = false;
      colorSelected = null;
      newTaskTitle = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String newRemarks;
    DateTime dateTime = DateTime.now();
    bool isChanged = false;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
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
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  hintText: "Enter Task",
                  hintStyle: TextStyle(
                    fontSize: 15,
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
              /* TextField(
                decoration: InputDecoration(
                  hintText: "Additional Information",
                  hintStyle: TextStyle(
                    fontSize: 15,
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
              ),*/
              ExpansionTile(
                leading: Icon(
                  Icons.label_outline,
                  size: 25,
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      "Label",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PixelOperator',
                        color: greenblue,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      labelSelected ? "(selected!)" : "",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PixelOperator',
                        color: greenblue.withOpacity(0.4),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 8, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              redLabel = !redLabel;
                              //print(redLabel);
                              if (redLabel) {
                                colorSelected = Colors.red;
                                blueLabel = false;
                                yellowLabel = false;
                                greenLabel = false;
                                cyanLabel = false;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: redLabel
                                ? Colors.red[800]
                                : Colors.red[300].withOpacity(0.8),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              blueLabel = !blueLabel;
                              //print(blueLabel);
                              if (blueLabel) {
                                colorSelected = Colors.blue;
                                redLabel = false;
                                yellowLabel = false;
                                greenLabel = false;
                                cyanLabel = false;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: blueLabel
                                ? Colors.blue[900]
                                : Colors.blue[300].withOpacity(0.8),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              yellowLabel = !yellowLabel;
                              //print(yellowLabel);
                              if (yellowLabel) {
                                colorSelected = Colors.yellow;
                                redLabel = false;
                                blueLabel = false;
                                greenLabel = false;
                                cyanLabel = false;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: yellowLabel
                                ? Colors.yellow[600]
                                : Colors.yellow[400].withOpacity(0.8),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              greenLabel = !greenLabel;
                              //print(greenLabel);
                              if (greenLabel) {
                                colorSelected = Colors.green;
                                redLabel = false;
                                blueLabel = false;
                                yellowLabel = false;
                                cyanLabel = false;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: greenLabel
                                ? Colors.green[800]
                                : Colors.green[300].withOpacity(0.8),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              cyanLabel = !cyanLabel;
                              //print(cyanLabel);
                              if (cyanLabel) {
                                colorSelected = Colors.cyan;
                                redLabel = false;
                                blueLabel = false;
                                yellowLabel = false;
                                greenLabel = false;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: cyanLabel
                                ? Colors.cyan[700]
                                : Colors.cyan[300].withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: ExpansionTile(
                  leading: Icon(
                    Icons.calendar_today,
                    size: 23,
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
                      height: MediaQuery.of(context).size.height * 0.16,
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
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  //print(newTaskTitle);
                  if (newTaskTitle != null) {
                    Provider.of<TaskData>(context)
                        .addTask(newTaskTitle, colorSelected, dateTime);

//                    } else {
//                      Provider.of<TaskData>(context)
//                          .addTaskWithoutColor(newTaskTitle, dateTime);
//                    }
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
