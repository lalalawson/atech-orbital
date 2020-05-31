import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    Key key,
  }) : super(
            key: key,
            backgroundColor: silverwhite,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black));
}
