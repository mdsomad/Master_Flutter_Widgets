
import 'package:flutter/material.dart';
import 'package:master_flutter/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: "Flutter Application",
     theme: ThemeData(
      primarySwatch: Colors.pink
     ),
     home: HomeView()
    );
  }
}