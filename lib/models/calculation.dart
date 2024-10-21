import 'package:flutter/material.dart';
import 'dart:math';

class CalculationModel extends ChangeNotifier {
  var _weightInteger = 60;
  var _weightDecimal = 0;
  var _height = 170;
  late final String _bmi = calculateBMI();

  int get weightInteger => _weightInteger;

  // set weightInteger(int value) {
  //   _weightInteger = value;
  //   notifyListeners();
  // }

  void onWeightIntegerChange(int value) {
    _weightInteger = value;
    notifyListeners();
  }

  int get weightDecimal => _weightDecimal;

  void onWeightDecimalChange(int value) {
    _weightDecimal = value;
    notifyListeners();
  }

  int get height => _height;

  void onHeightChange(int value) {
    _height = value;
    notifyListeners();
  }

  String get bmi => _bmi;

  String calculateBMI() {
    // Combine the integer and decimal parts of the weight
    double weight = _weightInteger + (_weightDecimal / 10);

    // Convert height from cm to meters
    double heightInMeters = _height / 100;

    // Calculate BMI: weight (kg) / height^2 (m^2)
    double bmiValue = weight / pow(heightInMeters, 2);

    // Return BMI value rounded to 1 decimal place
    return bmiValue.toStringAsFixed(1);
  }

}
