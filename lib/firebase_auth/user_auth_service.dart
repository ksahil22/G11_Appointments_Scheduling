import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignInBackend {
  FirebaseAuth auth = FirebaseAuth.instance;
  

  // register with email and password
  Future<bool?> registerWithEmail(String email, String password,
      String firstName, String lastName, BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: ((context) => const Center(
                child: CircularProgressIndicator(),
              )));
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("User created successfully");
      
     
      
      return true; // Registration successful
    } catch (e) {
      Navigator.pop(context);
      log("Error while creating user with email and password: ${e.toString()}");
      return false; // Return error message if registration fails
    }
  }

  // login with email and password
  Future<bool?> loginWithEmail(
      String email, String password, BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: ((context) => const Center(
                child: CircularProgressIndicator(),
              )));

       

      return true; // Login successful
    } catch (e) {
      Navigator.pop(context);
      log("Error while logging in with email and password: ${e.toString()}");
      return false; // Return error message if login fails
    }
  }

  // logout
  

  // reset password
 

  // // getting login details of user just for testings purposes.
  // Future<void> getLoginDetails() async {
  //   try {
  //     await firestore
  //         .collection("users")
  //         .doc(auth.currentUser!.uid)
  //         .get()
  //         .then((value) {
  //       log("getLoginDetails value: ${value.data()}");
  //       final snapShotData = value.data() as Map<String, dynamic>;
  //       UserModel userModel = UserModel.fromMap(snapShotData);
  //       log("userModel: ${userModel.toMap().toString()}");
  //     });
  //   } catch (e) {
  //     print("error in getting login details ${e.toString()}");
  //   }
  // }
}
