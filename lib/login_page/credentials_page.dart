import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';

class CredentialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
