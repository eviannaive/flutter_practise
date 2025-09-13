import 'package:flutter/material.dart';

class StackWidgetsScreen extends StatelessWidget {
  const StackWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(height: 300, width: 300, color: Colors.pink[300]),
          Container(height: 200, width: 200, color: Colors.pink[200]),
          Container(
            color: Colors.pink[600],
            alignment: const Alignment(1, -0.3),
            height: 150,
            width: 150,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink[100],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
