import 'package:flutter/material.dart';

class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // sliver app bar
          SliverAppBar(
            leading: Icon(Icons.menu),
            backgroundColor: Colors.deepPurple[200],
            expandedHeight: 300,
            // title: Text('SLIVER BAR'),
            floating: true, // 向上滾時顯示appbar
            pinned: true, // 是否釘選
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: Colors.pink),
              title: Text('SLIVER BAR', style: TextStyle(color: Colors.white)),
            ),
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 30,
            itemBuilder: (context, index) => Padding(
              child: Container(color: Colors.red[100]),
              padding: EdgeInsets.all(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
