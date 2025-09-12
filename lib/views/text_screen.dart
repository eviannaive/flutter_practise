import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinkFont = TextStyle(
      fontSize: 26,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Colors.pink[400],
    );
    final greenFont = TextStyle(
      fontSize: 26,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Colors.greenAccent[400],
    );

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Text Screen',
              style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.green[400],
              ),
            ),
            Text(
              'dkjfldgmvfki kdlfjmsflkmdslfjsdklfjsld',
              textAlign: TextAlign.center,
              style: pinkFont,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'vjoih hfkdjhg', style: greenFont),
                  TextSpan(text: 'vjoih hfkdjhg', style: pinkFont),
                ],
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
