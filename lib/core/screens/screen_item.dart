import 'package:flutter/material.dart';

class ScreenItem {
  final String key; // 由 assignIds 生成，如 0-1-2
  final String label;
  final IconData icon;
  final Widget screen;
  final List<ScreenItem>? children;
  final bool showInBottomNav;

  const ScreenItem({
    this.key = '',
    required this.label,
    required this.icon,
    required this.screen,
    this.children,
    this.showInBottomNav = false,
  });

  bool get isGroup => children != null && children!.isNotEmpty;
  bool get isLeaf => children == null || children!.isEmpty;
}
