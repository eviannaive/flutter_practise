import 'package:flutter/material.dart';
import 'package:test/core/screens/screen_item.dart';
import 'package:test/views/base_rotate_screen.dart';
import 'package:test/views/curve_and_clippers_screen.dart';
import 'package:test/views/animations_screen.dart';
import 'package:test/views/dialog_screen.dart';
import 'package:test/views/gesture_screen.dart';
import 'package:test/views/grid_screen.dart';
import 'package:test/views/image_screen.dart';
import 'package:test/views/input_screen.dart';
import 'package:test/views/list_screen.dart';
import 'package:test/views/media_query_screen.dart';
import 'package:test/views/pageview_screen.dart';
import 'package:test/views/sliver_screen.dart';
import 'package:test/views/stack_widgets_screen.dart';
import 'package:test/views/tap_to_animate.dart';
import 'package:test/views/tapbar_screen.dart';
import 'package:test/views/text_screen.dart';
import 'package:test/views/timer_screen.dart';
import 'package:test/views/widgets_screen.dart';

/// 原始定義（不需要 key）
final List<ScreenItem> rawScreens = [
  ScreenItem(
    label: 'Widgets',
    icon: Icons.widgets,
    screen: WidgetsScreen(),
    showInBottomNav: true,
    children: [
      ScreenItem(
        label: 'Grid Screen',
        icon: Icons.grid_3x3,
        screen: GridScreen(),
      ),
      ScreenItem(
        label: 'Gesture Screen',
        icon: Icons.gesture,
        screen: GestureScreen(),
      ),
      ScreenItem(label: 'List Screen', icon: Icons.list, screen: ListScreen()),
      ScreenItem(
        label: 'Image Screen',
        icon: Icons.image,
        screen: ImageScreen(),
      ),
      ScreenItem(
        label: 'Sliver Screen',
        icon: Icons.view_day,
        screen: SliverScreen(),
      ),
      ScreenItem(
        label: 'TapBar Screen',
        icon: Icons.tab,
        screen: TapBarScreen(),
      ),
      ScreenItem(
        label: 'Dialog Screen',
        icon: Icons.bus_alert,
        screen: DialogScreen(),
      ),
      ScreenItem(
        label: 'Text Screen',
        icon: Icons.text_fields,
        screen: TextScreen(),
      ),
      ScreenItem(
        label: 'Timer Screen',
        icon: Icons.timer,
        screen: TimerScreen(),
      ),
      ScreenItem(
        label: 'PageView Screen',
        icon: Icons.pages,
        screen: PageviewScreen(),
      ),
      ScreenItem(
        label: 'Stack Widget',
        icon: Icons.panorama_wide_angle,
        screen: StackWidgetsScreen(),
      ),
      ScreenItem(label: 'Input', icon: Icons.input, screen: InputScreen()),
    ],
  ),
  ScreenItem(
    label: 'Animations',
    icon: Icons.animation,
    screen: AnimationsScreen(),
    showInBottomNav: true,
    children: [
      ScreenItem(
        label: 'Tap To Animate',
        icon: Icons.transform,
        screen: TapToAnimateScreen(),
      ),
      ScreenItem(
        label: 'Base Rotate',
        icon: Icons.rotate_90_degrees_ccw,
        screen: BaseRotateScreen(),
      ),
      ScreenItem(
        label: 'Curve And Clippers',
        icon: Icons.movie_filter,
        screen: CurveAndClippersScreen(),
      ),
    ],
  ),
  ScreenItem(
    label: 'Media Query',
    icon: Icons.screen_rotation,
    screen: MediaQueryScreen(),
    showInBottomNav: true,
  ),
];

/// 依索引路徑生 key（0-1-2），並保留 showInBottomNav
ScreenItem assignIds(ScreenItem item, int index, [String prefix = '']) {
  final key = prefix.isEmpty ? '$index' : '$prefix-$index';

  final List<ScreenItem>? mappedChildren =
      (item.children == null || item.children!.isEmpty)
      ? null
      : [
          for (final entry in item.children!.asMap().entries)
            assignIds(entry.value, entry.key, key),
        ];

  return ScreenItem(
    key: key,
    label: item.label,
    icon: item.icon,
    screen: item.screen,
    children: mappedChildren,
    showInBottomNav: item.showInBottomNav,
  );
}

/// 建好含 key 的根清單
List<ScreenItem> buildScreensWithKeys(List<ScreenItem> roots) {
  return [
    for (final entry in roots.asMap().entries)
      assignIds(entry.value, entry.key),
  ];
}
