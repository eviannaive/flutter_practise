import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final int index;
  const Circle({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
        child: Center(child: Text('$index')),
      ),
    );
  }
}
