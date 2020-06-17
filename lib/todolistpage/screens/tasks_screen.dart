import 'package:flutter/material.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:purrductive/todolistpage/widgets/tasks_list.dart';
import 'package:purrductive/todolistpage/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/todolistpage/widgets/EmptyListMessage.dart';
import 'package:purrductive/todolistpage/widgets/Progress_Bar.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      appBar: AppBar(
        backgroundColor: silverwhite,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Tasks",
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'PixelOperator',
            color: Colors.black,
          ),
        ),
      ), //MyAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          /*Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset('images/TaskBoard.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total: ${Provider.of<TaskData>(context).taskCount} ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'PixelOperator',
                        letterSpacing: 2.5,
                      ),
                    ),
                    Text(
                      'Completed: ${Provider.of<TaskData>(context).taskDone} ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'PixelOperator',
                        letterSpacing: 2.5,
                      ),
                    ),
                    Text(
                      'Left: ${Provider.of<TaskData>(context).taskLeft} ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'PixelOperator',
                        letterSpacing: 2.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          RaisedButton(
                            color: yellow,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: AddTaskScreen(),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Add Task",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'pixelsix',
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, timerPage);
                            },
                            child: Text(
                              "Start Timer",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'pixelsix',
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ), */
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Progressbar(context),
              ),
              Expanded(
                flex: 10,
                child: listOfTask(context),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      color: yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          width: 4,
                          color: darkYellow,
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: AddTaskScreen(),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add Task",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'pixelsix',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: cyan,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          width: 4,
                          color: darkCyan,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, timerPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Start Timer",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'pixelsix',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listOfTask(BuildContext context) {
    return Provider.of<TaskData>(context).isEmpty
        ? EmptyListMessage()
        : TasksList();
  }

  Widget Progressbar(BuildContext context) {
    if (!Provider.of<TaskData>(context).isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ProgressBar(),
      );
    } else {
      return Container();
    }
  }
}
