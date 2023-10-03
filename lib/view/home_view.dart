import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink,
        child: Center(child: Text('Hello world',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w700),)),
      ),
    );
  }
}
