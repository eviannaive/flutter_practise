import 'package:test/core/screens/screen_data.dart';
import 'package:test/core/screens/screen_item.dart';
import 'package:test/core/screens/screen_methods.dart' as methods;

class ScreenManager {
  // 建好含 key 的根清單（不可變快照）
  static final List<ScreenItem> screens = List.unmodifiable(
    buildScreensWithKeys(rawScreens),
  );

  /// BottomNav 用：通常只放最上層群組
  static List<ScreenItem> get bottomNavScreens =>
      screens.where((s) => s.showInBottomNav).toList(growable: false);

  /// BottomNav 對應回根索引（for currentIndex 對齊）
  static List<int> get bottomNavIndices => screens
      .asMap()
      .entries
      .where((e) => e.value.showInBottomNav)
      .map((e) => e.key)
      .toList(growable: false);

  /// 封裝樹工具（對外只曝露 findByKey）
  static ScreenItem? findByKey(String key) =>
      methods.findByKeyInTree(screens, key);

  // 如果你要 path/breadcrumb，也能選擇性曝露
  static List<ScreenItem> findPath(String key) =>
      methods.findPath(screens, key);

  static int rootIndexFromKey(String key) => methods.rootIndexFromKey(key);

  static bool isChild(String key) => methods.isChild(key);

  static String? parentOf(String key) => methods.parentOf(key);
}
