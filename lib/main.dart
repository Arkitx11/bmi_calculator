import 'package:bmi_calculator/ui/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalculatorApp());
}

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BmiCalculatorAppPortrait());
  }
}

class BmiCalculatorAppPortrait extends StatelessWidget {
  const BmiCalculatorAppPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeScreen());
  }
}

