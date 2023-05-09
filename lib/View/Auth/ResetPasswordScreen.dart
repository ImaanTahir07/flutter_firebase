import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase/View/Auth/LoginScreen.dart';
import 'package:flutter_firebase/Widgets/RoundButton.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                controller: forgetPasswordController,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mail),
                    hintText: "Enter Email",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 25,
              ),
              RoundButton(
                title: "Reset Password",
                callback: () async {
                  var forgetpassword = forgetPasswordController.text.trim();

                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgetpassword)
                        .then((value) => {
                              print("Email Sent!"),
                              Get.off(() => LoginScreen())
                            });
                  } on FirebaseAuthException catch (e) {
                    print(e.toString());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
