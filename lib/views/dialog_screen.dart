import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber[100],
          title: Text('Hello World : )'),
          content: Text('gagagagaga'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
        // return CupertinoAlertDialog(

        //   title: Text('Hello World : )'),
        //   content: Text('gagagagaga'),
        //   actions: [
        //     TextButton(onPressed: () {}, child: Text('CANCEL')),
        //     TextButton(onPressed: () {}, child: Text('OK')),
        //   ],
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        color: Colors.amber[200],
        onPressed: _showDialog,
        child: Text('Show Dialog', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
