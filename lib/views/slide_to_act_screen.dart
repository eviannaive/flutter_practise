import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToActScreen extends StatefulWidget {
  const SlideToActScreen({super.key});

  @override
  State<SlideToActScreen> createState() => _SlideToActScreenState();
}

class _SlideToActScreenState extends State<SlideToActScreen> {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: SlideAction(
            borderRadius: 4,
            elevation: 0,
            innerColor: Colors.deepPurple,
            outerColor: Colors.deepPurple[100],
            sliderButtonIcon: Icon(Icons.lock_open, color: Colors.white),
            text: 'Slide to unlock',
            textStyle: TextStyle(color: Colors.deepPurple[800], fontSize: 24),
            sliderRotate: false,
            onSubmit: () {
              Navigator.of(context).pushNamed('/pakages');
            },
          ),
        ),
      ],
    );
  }
}
