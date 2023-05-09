import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/View/Auth/LoginScreen.dart';
import 'package:get/get.dart';

import '../View/TestScreen.dart';

UserSignUp(String useremail, String userpassword) async {
  User? current = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("Users").doc(current!.uid).set({
      'email': useremail,
      'password': userpassword,
      'createdAt': DateTime.now(),
      'userId': current.uid,
    }).then((value) =>
        {FirebaseAuth.instance.signOut(), Get.to(() => LoginScreen())});
  } on FirebaseAuthException catch (e) {
    print(e.toString());
  }
}
