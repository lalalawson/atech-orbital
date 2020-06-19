import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/const/components.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purrductive/homepage/HomePage.dart';

final _firestore = Firestore.instance;

class CredentialsPage extends StatefulWidget {
  @override
  _CredentialsPageState createState() => _CredentialsPageState();
}

class _CredentialsPageState extends State<CredentialsPage>
    with SingleTickerProviderStateMixin {
  String email;
  String password;
  String userName;
  bool showSpinner = false;

  final textController = TextEditingController();
  final textController2 = TextEditingController();
  final _auth = FirebaseAuth.instance;

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      appBar: MyAppBar(),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TyperAnimatedTextKit(
                speed: Duration(milliseconds: 200),
                pause: Duration(milliseconds: 1800),
                isRepeatingAnimation: false,
                text: ['purrductive'],
                textStyle: TextStyle(
                  fontFamily: 'pixelsix',
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: animation.value * 50,
                child: Center(
                  child: TextField(
                    controller: textController,
                    onChanged: (value) {
                      email = value;
                    },
                    style: TextStyle(
                      fontFamily: 'pixelmix',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    decoration: kTextFieldInputDecoration.copyWith(
                      hintText: 'email',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: animation.value * 50,
                child: Center(
                  child: TextField(
                    controller: textController2,
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    style: TextStyle(
                      fontFamily: 'pixelmix',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    decoration: kTextFieldInputDecoration.copyWith(
                      hintText: 'password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Hero(
                tag: 'log in',
                child: SizedBox(
                  width: 200.0,
                  child: RaisedButton(
                    color: cyan,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        width: 4,
                        color: darkCyan,
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          textController.clear();
                          textController2.clear();
                          email = '';
                          password = '';
                          await _firestore
                              .collection("users")
                              .document(user.user.uid)
                              .get()
                              .then(
                                  (value) => userName = value.data['username']);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        username: userName,
                                      )));
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'pixelsix',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
