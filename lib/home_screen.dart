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
        child: RichText(text: TextSpan(
          style: TextStyle( color: Colors.black),
        
          children: [
            TextSpan( text: ("Don't have an account..??" ),style: TextStyle(fontSize: 20)),
            
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: InkWell(
              
              onTap: (){
                print("HELLO");
              },
              child: Text(" Sign Up",style: TextStyle(fontSize: 20,color: Colors.blue),),
              
            ))

            

            
          ]
        )),
      )
    );
  }
}
