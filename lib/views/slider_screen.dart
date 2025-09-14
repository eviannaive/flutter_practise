import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _value = 0.5;

  void _handleSliderChange(double value) {
    setState(() {
      _value = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 26,
          children: [
            Text('Value: $_value', style: TextStyle(fontSize: 24)),
            Slider(
              value: _value,
              min: 0,
              max: 20,
              divisions: 40, // 分割
              label: _value.toString(),
              activeColor: Colors.pink,
              inactiveColor: Colors.blue[100],
              thumbColor: Colors.greenAccent[100],
              onChanged: _handleSliderChange,
            ),
          ],
        ),
      ),
    );
  }
}
