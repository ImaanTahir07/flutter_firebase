import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase/View/Auth/ResetPasswordScreen.dart';
import 'package:flutter_firebase/View/Auth/SignupScreen.dart';
import 'package:flutter_firebase/View/TestScreen.dart';
import 'package:flutter_firebase/Widgets/RoundButton.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResetPasswordScreen(),
                                      ));
                                },
                                child: Text("Reset password")),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    )),
                RoundButton(
                  title: "Login",
                  callback: () async {
                    if (_formkey.currentState!.validate()) {
                      var loginEmail = emailController.text.trim();
                      var loginPassword = passwordController.text.trim();

                      try {
                        final User? firebaseUser = (await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: loginEmail, password: loginPassword))
                            .user;
                        if (firebaseUser != null) {
                          Get.to(() => TestScreen());
                          Get.snackbar("Success!", "Logged in successfully");
                        } else {
                          print("Login Failed");
                        }
                      } on FirebaseAuthException catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ));
                        },
                        child: Text("Sign up"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
