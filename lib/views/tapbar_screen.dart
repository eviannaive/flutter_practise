import 'package:flutter/material.dart';
import 'package:test/views/image_screen.dart';
import 'package:test/views/list_screen.dart';

class TapBarScreen extends StatelessWidget {
  const TapBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: const Text('TapBar Screen')),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.emoji_flags)),
                Tab(icon: Icon(Icons.record_voice_over_rounded)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 會按照順序切換
                  ImageScreen(),
                  Container(
                    child: Center(child: Text('Emoji')),
                    color: Colors.deepPurple[200],
                  ),
                  Container(
                    child: Center(child: Text('Voice')),
                    color: Colors.deepPurple[300],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
