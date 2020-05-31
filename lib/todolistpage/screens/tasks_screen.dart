import 'package:flutter/material.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:purrductive/todolistpage/widgets/tasks_list.dart';
import 'package:purrductive/todolistpage/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/todolistpage/widgets/EmptyListMessage.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      appBar: MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset('images/taskoverview.png'),
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
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: silverwhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Provider.of<TaskData>(context).isEmpty
                  ? Center(child: EmptyListMessage())
                  : TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
