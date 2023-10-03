
import 'package:flutter/material.dart';
import 'package:master_flutter/view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Flutter Application",
     home: HomeView()
    );
  }
}