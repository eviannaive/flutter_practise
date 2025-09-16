import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWidgetScreen extends StatefulWidget {
  const SlidableWidgetScreen({super.key});

  @override
  State<SlidableWidgetScreen> createState() => _SlidableWidgetScreenState();
}

class _SlidableWidgetScreenState extends State<SlidableWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slidable(
          startActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.green,
                icon: Icons.phone,
                onPressed: (context) {},
              ),
              SlidableAction(
                flex: 2,
                backgroundColor: Colors.blue,
                icon: Icons.chat,
                onPressed: (context) {},
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                flex: 1,
                backgroundColor: Colors.red,
                icon: Icons.delete,
                onPressed: (context) {},
              ),
            ],
          ),
          child: Container(
            color: Colors.grey[300],
            child: ListTile(
              title: Text('Mitch Koko'),
              subtitle: Text('Flutter Developer'),
              leading: Icon(Icons.person, size: 40),
            ),
          ),
        ),
      ),
    );
  }
}
