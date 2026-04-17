import 'package:flutter/material.dart';
import 'package:flutter_practice/homescreen.dart';
import 'package:flutter_practice/item.dart';
import 'package:flutter_practice/todo.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const ItemScreen(),
      ),
    );
  }
}
