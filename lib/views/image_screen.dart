import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Screen')),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 300,
            width: 300,
            color: Colors.amber,
            child: Image.asset('assets/img001.jpeg', fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
