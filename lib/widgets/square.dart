import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final int index;
  const Square({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.pink[300],
        child: Center(child: Text('Square $index')),
      ),
    );
  }
}
