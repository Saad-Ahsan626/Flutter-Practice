import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

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
      home: Scaffold(
        body: FlutterMap(
          mapController: MapController(),
          options: MapOptions(),
          children: [TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  
),],
        ),
      ),
    );
  }
}
