import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase/View/Auth/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Firebase Services/SignupServices.dart';
import '../../Widgets/RoundButton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  User? current = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                            return "Enter valid Email";
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  )),
              RoundButton(
                title: "Signup",
                callback: () async {
                  var useremail = emailController.text.trim();
                  var userpassword = passwordController.text.trim();
                  if (_formkey.currentState!.validate()) {
                    await _auth
                        .createUserWithEmailAndPassword(
                            email: useremail, password: userpassword)
                        .then((value) => {
                              UserSignUp(useremail, userpassword),
                            });
                    Get.snackbar("Success", "Registration Successful!");

                    emailController.clear();
                    passwordController.clear();
                  } else {
                    Get.snackbar("Error", "Enter Valid Details");
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
