import 'package:flutter/material.dart';

class TapToAnimateScreen extends StatefulWidget {
  const TapToAnimateScreen({super.key});

  @override
  _TapToAnimateScreenState createState() => _TapToAnimateScreenState();
}

class _TapToAnimateScreenState extends State<TapToAnimateScreen> {
  double boxHeight = 100;
  double boxWidth = 100;
  Color boxColor = Colors.blue;

  void _expandBox() {
    setState(() {
      boxWidth = 300;
      boxHeight = 300;
    });
  }

  void _changeColor() {
    setState(() {
      boxColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
        body: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            color: boxColor,
            height: boxHeight,
            width: boxWidth,
          ),
        ),
      ),
    );
  }
}
