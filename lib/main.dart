import 'package:flutter/material.dart';
import 'package:flutter_practice/homescreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();    
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: true,
        title: 'Flutter Demo',
        home: Homescreen1(),
      ),
    );
  }
}
