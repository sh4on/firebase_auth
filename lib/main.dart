import 'package:flutter/material.dart';
import 'package:practice/features/authentication/pages/signup_screen.dart';
import 'package:practice/features/home/pages/home.dart';

import 'features/authentication/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}