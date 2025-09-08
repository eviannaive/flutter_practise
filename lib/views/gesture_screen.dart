import 'package:flutter/material.dart';

class GestureScreen extends StatefulWidget {
  const GestureScreen({super.key});

  @override
  _GestureScreenState createState() => _GestureScreenState();
}

class _GestureScreenState extends State<GestureScreen> {
  // variable
  int numberTimesTapped = 0;

  //method
  void _increaseNumber() {
    setState(() {
      numberTimesTapped++;
    });
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Tapped $numberTimesTapped times',
              style: TextStyle(fontSize: 30.0),
            ),
            GestureDetector(
              onTap: _increaseNumber,
              // onTap: () {
              //   setState(() {
              //     // 一定要這樣包才行＠＿＠
              //     numberTimesTapped++;
              //   });
              // },
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.green[300],
                child: Text('Tap Here', style: TextStyle(fontSize: 30.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
