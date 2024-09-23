import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teste1/firebase_options.dart';
import 'package:teste1/src/pages/home_page.dart';
import 'package:teste1/src/pages/user_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
      routes: {
        '/user_page': (context) => UserPage(),
        '/home_paghe': (context) => HomePage()
      },
    );
  }
}
