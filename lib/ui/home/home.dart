import 'package:bmi_calculator/models/calculation.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculationModel>(builder: (context, calculation, child) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WeightSelector(
                  calculation.weightInteger,
                  calculation.weightDecimal,
                  calculation.onWeightIntegerChange,
                  calculation.onWeightDecimalChange),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  HeightPicker(calculation.height, calculation.onHeightChange),
            ),
            BmiResult(calculation.calculateBMI())
          ],
        ),
      );
    });
  }
}

class WeightSelector extends StatelessWidget {
  final int integerValue;
  final int decimalValue;
  final Function(int) onIntegerValueChange;
  final Function(int) onDecimalValueChange;

  const WeightSelector(this.integerValue, this.decimalValue,
      this.onIntegerValueChange, this.onDecimalValueChange,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Weight'),
        const SizedBox(width: 24),
        SizedBox(
            height: 100,
            width: 60,
            child: NumberPicker(
                minValue: 30,
                maxValue: 300,
                value: integerValue,
                onChanged: (int value) {
                  onIntegerValueChange(value);
                })),
        const Text(
          '.',
        ),
        SizedBox(
            height: 120,
            width: 60,
            child: NumberPicker(
                minValue: 0,
                maxValue: 9,
                value: decimalValue,
                onChanged: (int value) {
                  onDecimalValueChange(value);
                })),
        const Text('Kg')
      ],
    );
  }
}

class HeightPicker extends StatelessWidget {
  final int height;
  final Function(int) onHeightChange;

  const HeightPicker(this.height, this.onHeightChange, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Height'),
        const SizedBox(width: 24),
        SizedBox(
            height: 120,
            width: 124,
            child: NumberPicker(
                minValue: 100,
                maxValue: 250,
                value: height,
                onChanged: (int value) {
                  onHeightChange(value);
                })),
        const Text('cm')
      ],
    );
  }
}

class BmiResult extends StatelessWidget {
  final String result;
  const BmiResult(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Your BMI is $result');
  }
}

