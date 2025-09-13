import 'package:flutter/material.dart';

class AnimatedIconsScreen extends StatefulWidget {
  const AnimatedIconsScreen({super.key});

  @override
  State<AnimatedIconsScreen> createState() => _AnimatedIconsScreenState();
}

class _AnimatedIconsScreenState extends State<AnimatedIconsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _videoPlaying = false;

  @override
  initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _iconTapped() {
    // 這裡不用setState是因為 _videoPlaying 不用即時更新畫面上，而是透過 _animationController 來更新動畫
    if (_videoPlaying) {
      _animationController.reverse();
      _videoPlaying = false;
    } else {
      _animationController.forward();
      _videoPlaying = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _iconTapped,
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
            size: 150,
          ),
        ),
      ),
    );
  }
}
