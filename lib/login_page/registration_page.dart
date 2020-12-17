import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/const/components.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with SingleTickerProviderStateMixin {
  String email;
  String password;
  String username;
  bool _weakPassword = false;
  bool _badEmail = false;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

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
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: silverwhite,
        appBar: MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TyperAnimatedTextKit(
                  speed: Duration(milliseconds: 200),
                  pause: Duration(milliseconds: 1800),
                  isRepeatingAnimation: false,
                  text: ['register'],
                  textStyle: TextStyle(
                    fontFamily: 'pixelsix',
                    fontSize: 50.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: animation.value * 50,
                child: TextField(
                  onChanged: (value) {
                    username = value;
                  },
                  style: TextStyle(
                    fontFamily: 'pixelmix',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                  decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'username',
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: animation.value * 50,
                child: TextField(
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
              SizedBox(
                height: 30.0,
                child: _weakPassword
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Use a valid email \'@email.com\'!",
                          style: TextStyle(
                              color: darkRed,
                              fontFamily: 'pixelmix',
                              fontSize: 10.0),
                        ),
                      )
                    : null,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: animation.value * 50,
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
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
              SizedBox(
                height: 30.0,
                child: _weakPassword
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Password has to be at least 6 characters!',
                          style: TextStyle(
                              color: darkRed,
                              fontFamily: 'pixelmix',
                              fontSize: 10.0),
                        ),
                      )
                    : null,
              ),
              Hero(
                tag: 'register',
                child: SizedBox(
                  width: 200.0,
                  child: RaisedButton(
                    color: yellow,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        width: 4,
                        color: darkYellow,
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        if (password.length < 6) {
                          print('weak');
                          setState(() {
                            showSpinner = false;
                            _weakPassword = true;
                          });
                        } else {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );

                          String uid = newUser.user.uid;

                          _firestore.collection('users').document(uid).setData({
                            "email": email,
                            "username": username,
                            "password": password,
                            "uid": uid,
                            "currency": 0,
                          });

                          if (newUser != null) {
                            Navigator.pushReplacementNamed(
                                context, credentialsPage);
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        }
                      } catch (e) {
                        print(e);
                        setState(() {
                          _badEmail = true;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
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
