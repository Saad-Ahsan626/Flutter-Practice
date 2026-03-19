import 'package:flutter/material.dart';
import 'package:flutter_practice/login.dart';



void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}
