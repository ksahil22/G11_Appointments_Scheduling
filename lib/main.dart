import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:g11_appointment_scheduling/views/home_screen.dart';
import 'package:g11_appointment_scheduling/views/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBvukBmaapwqLcI1lH-9Oq1MUF6gwu49Ps',
      appId: '1:693976677823:web:e2503bd5092bbb405bf50a',
      messagingSenderId: '693976677823',
      projectId: 'medischedule-e9c94',
      authDomain: 'medischedule-e9c94.firebaseapp.com',
      storageBucket: 'medischedule-e9c94.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediSchedule',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
