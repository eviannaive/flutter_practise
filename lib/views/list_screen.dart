import 'package:flutter/material.dart';
import 'package:test/widgets/circle.dart';
import 'package:test/widgets/square.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        title: const Text('List Screen'),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/home');
            Navigator.of(context).pushNamed('/');
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Circle(index: index);
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Square(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
