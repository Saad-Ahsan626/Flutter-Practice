import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:lottie/lottie.dart';

void main() async {
  runApp(MyApp());
}

double height = 200, width = 200;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Lottie.asset("assets/loading.json")
        ),
      ),
    );
  }
}
