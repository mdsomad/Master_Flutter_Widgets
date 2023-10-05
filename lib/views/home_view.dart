import 'package:flutter/material.dart';
import 'package:master_flutter/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Container(
          color: Colors.pink,
          child: CalculatorView()
        ),
      ),
    );
  }
}
