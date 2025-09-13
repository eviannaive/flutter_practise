import 'package:flutter/material.dart';

class PageviewScreen extends StatelessWidget {
  final _controller = PageController();

  // PageController有了參數所以它是一個 mutable（可變）實例變數，不能用 const
  PageviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: [
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
      ],
    );
  }
}
