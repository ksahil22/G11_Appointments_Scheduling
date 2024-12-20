import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/models/user_model.dart';
import 'package:g11_appointment_scheduling/views/home_screen.dart';
import 'package:g11_appointment_scheduling/views/signin_screen.dart';

class SignInBackend {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
      String uid = auth.currentUser!.uid;
      int timeStamp = DateTime.now().millisecondsSinceEpoch;
      if (uid.isNotEmpty) {
        UserModel userLoginModel = UserModel(
          email: email,
          firstName: firstName,
          lastName: lastName,
          phone: "",
          chats: "",
          appointments: [],
          loginTimestamp: timeStamp,
          id: uid,
        );
        await firestore
            .collection("users")
            .doc(auth.currentUser!.uid)
            .set(userLoginModel.toJson());
        log("User added to firestore successfully");
      } else {
        throw Exception("User id is empty");
      }
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
      // user created successfully
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

      if (auth.currentUser != null) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Sign out"),
                  content: const Text(
                      "You are already signed in. Please sign out to continue."),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          await auth.signOut();
                          Navigator.pop(context);
                        },
                        child: const Text("Sign out"))
                  ],
                ));
      } else {
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pop(context);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        log("User logged in successfully");
      }

      return true; // Login successful
    } catch (e) {
      Navigator.pop(context);
      log("Error while logging in with email and password: ${e.toString()}");
      return false; // Return error message if login fails
    }
  }

  // logout
  Future<void> logout(BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: ((context) => const Center(
                child: CircularProgressIndicator(),
              )));
      await auth.signOut();
      Navigator.pop(context);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      log("User logged out successfully");
    } catch (e) {
      Navigator.pop(context);
      log("Error while logging out: ${e.toString()}");
    }
  }
}
