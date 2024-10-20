import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WeightSelector(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HeightPicker(),
          ),
        ],
      ),
    );
  }
}

class WeightSelector extends StatefulWidget {
  const WeightSelector({super.key});

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  int integerValue = 60;
  int decimalValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text('Weight'),
        SizedBox(width: 24),
        SizedBox(height: 100,width: 60,
          child: NumberPicker(minValue: 30, maxValue: 300, value: integerValue, onChanged: (int value) {
            setState(() {
              integerValue = value;
            });
          })
        ),
        Text('.', ),
        SizedBox(height: 120,width: 60,
            child: NumberPicker(minValue: 0, maxValue: 9, value: decimalValue, onChanged: (int value) {
              setState(() {
                decimalValue = value;
              });
            })
        ),
        Text('Kg')
      ],
    );
  }
}

class HeightPicker extends StatefulWidget {
  const HeightPicker({super.key});

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  int input = 170;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text('Height'),
        SizedBox(width: 24),
        SizedBox(height: 120,width: 124,
            child: NumberPicker(minValue: 100, maxValue: 250, value: input, onChanged: (int value) {
              setState(() {
                input = value;
              });
            })
        ),
        Text('cm')
      ],
    );
  }
}


