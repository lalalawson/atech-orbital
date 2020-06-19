import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/const/components.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email;
  String password;
  String username;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: silverwhite,
        appBar: MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'register',
                style: TextStyle(
                  fontFamily: 'pixelsix',
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
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
                  hintText: 'Username',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
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
              SizedBox(
                height: 10.0,
              ),
              TextField(
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
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
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
                        Navigator.pushNamed(context, credentialsPage);
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
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'pixelsix',
                        color: Colors.black,
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
