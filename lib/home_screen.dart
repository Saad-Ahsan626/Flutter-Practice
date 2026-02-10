import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget 
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      
      appBar: AppBar 
      (
        
        title: const Text('Home Screen', ),
        backgroundColor: Colors.blue,
        
        
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage("assets/image1.jpg"),
              height: 200,),
            CircleAvatar(
              
              radius: 100,
              backgroundImage: AssetImage("assets/image1.jpg"),
            ),
          ],
        ),
      )
    );
  }
}
