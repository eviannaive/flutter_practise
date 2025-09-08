// import 'package:flutter/material.dart';
// import 'package:test/views/animated_screen.dart';
// import 'package:test/views/animation_screen.dart';
// import 'package:test/views/gesture_screen.dart';
// import 'package:test/views/grid_screen.dart';
// import 'package:test/views/home_screen.dart';
// import 'package:test/views/image_screen.dart';
// import 'package:test/views/list_screen.dart';
// import 'package:test/views/sliver_screen.dart';
// import 'package:test/views/tapbar_screen.dart';
// import 'package:test/views/animation2_screen.dart';

// class ScreenItem {
//   final String key;
//   final String label;
//   final IconData icon;
//   final Widget screen;
//   final List<ScreenItem>? children;
//   final bool showInBottomNav;

//   const ScreenItem({
//     this.key = '',
//     required this.label,
//     required this.icon,
//     required this.screen,
//     this.children,
//     this.showInBottomNav = false,
//   });

//   bool get isGroup => children != null && children!.isNotEmpty;
//   bool get isLeaf => children == null || children!.isEmpty;
// }

// final List<ScreenItem> allScreens = [
//   ScreenItem(
//     label: 'Widgets',
//     icon: Icons.widgets,
//     screen: HomeScreen(),
//     showInBottomNav: true,
//     children: [
//       ScreenItem(
//         label: 'Grid Screen',
//         icon: Icons.grid_3x3,
//         screen: GridScreen(),
//       ),
//       ScreenItem(
//         label: 'Gesture Screen',
//         icon: Icons.event,
//         screen: GestureScreen(),
//       ),
//       ScreenItem(label: 'List Screen', icon: Icons.list, screen: ListScreen()),
//       ScreenItem(
//         label: 'Image Screen',
//         icon: Icons.image,
//         screen: ImageScreen(),
//       ),
//       ScreenItem(
//         label: 'Sliver Screen',
//         icon: Icons.view_day,
//         screen: SliverScreen(),
//       ),
//       ScreenItem(
//         label: 'TapBar Screen',
//         icon: Icons.tab,
//         screen: TapBarScreen(),
//       ),
//     ],
//   ),

//   ScreenItem(
//     label: 'Animations',
//     icon: Icons.animation,
//     screen: AnimatedScreen(),
//     showInBottomNav: true,
//     children: [
//       ScreenItem(
//         label: 'Animation Screen',
//         icon: Icons.movie,
//         screen: AnimationScreen(),
//       ),
//       ScreenItem(
//         label: 'Animation2 Screen',
//         icon: Icons.movie_filter,
//         screen: Animation2Screen(),
//       ),
//     ],
//   ),
// ];

// ScreenItem assignIds(ScreenItem item, int index, [String prefix = '']) {
//   final key = prefix.isEmpty ? index.toString() : '$prefix-$index';
//   // 如果 需要 child + index → 用 asMap().entries 是 Dart 最簡潔的寫法
//   final currentChildren = item.isGroup
//       ? [
//           for (var entry in item.children!.asMap().entries)
//             assignIds(entry.value, entry.key, key),
//         ]
//       : null;
//   return ScreenItem(
//     key: key,
//     label: item.label,
//     icon: item.icon,
//     screen: item.screen,
//     children: currentChildren,
//     showInBottomNav: item.showInBottomNav,
//   );
// }

// class ScreenManager {
//   static final List<ScreenItem> screens = [
//     for (final entry in allScreens.asMap().entries)
//       assignIds(entry.value, entry.key),
//   ];
//   static List<ScreenItem> get bottomNavScreens =>
//       screens.where((screen) => screen.showInBottomNav).toList(growable: false);

//   /// 底部導航對應的索引（根索引）
//   /// 注意：這邊使用 int
//   static List<int> get bottomNavIndices => screens
//       .asMap()
//       .entries
//       .where((e) => e.value.showInBottomNav)
//       .map((e) => e.key)
//       .toList(growable: false); // 要toList才能用list的方法

//   /// 用 key 尋找節點
//   static ScreenItem? findByKey(String key) {
//     for (final root in screens) {
//       final found = _findByKeyDfs(root, key);
//       if (found != null) return found;
//     }
//     return null;
//   }

//   /// 從任意節點 key 取得它的「根索引」（字串第一段）
//   static int rootIndexFromKey(String key) {
//     final first = key.split('-').first;
//     return int.tryParse(first) ?? 0;
//   }

//   static bool isChildKey(String key) => key.contains('-');

//   // Depth-First Search
//   static ScreenItem? _findByKeyDfs(ScreenItem node, String key) {
//     if (node.key == key) return node;
//     final kids = node.children;
//     if (kids == null || kids.isEmpty) return null;
//     for (final child in kids) {
//       final found = _findByKeyDfs(child, key);
//       if (found != null) return found;
//     }
//     return null;
//   }
// }
