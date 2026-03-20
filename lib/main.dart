import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                height: height,
                width: width,
                color: Colors.white10,
              ),
            ),
            ElevatedButton(
              child: Text("Change Size"),
              onPressed: () {
                height = 400;
                width = 400;
              },
            ),
          ],
        ),
      ),
    );
  }
}
