import 'package:test/core/screens/screen_item.dart';

ScreenItem? findByKeyInTree(List<ScreenItem> roots, String key) {
  for (final r in roots) {
    final f = _dfs(r, key);
    if (f != null) return f;
  }
  return null;
}

ScreenItem? _dfs(ScreenItem node, String key) {
  if (node.key == key) return node;
  final kids = node.children;
  if (kids == null || kids.isEmpty) return null;
  for (final c in kids) {
    final f = _dfs(c, key);
    if (f != null) return f;
  }
  return null;
}

List<ScreenItem> findPath(List<ScreenItem> roots, String key) {
  for (final r in roots) {
    final path = <ScreenItem>[];
    if (_dfsPath(r, key, path)) return path;
  }
  return const [];
}

bool _dfsPath(ScreenItem node, String key, List<ScreenItem> acc) {
  acc.add(node);
  if (node.key == key) return true;
  final kids = node.children;
  if (kids != null) {
    for (final c in kids) {
      if (_dfsPath(c, key, acc)) return true;
    }
  }
  acc.removeLast();
  return false;
}

/// 取得根索引（key 第一段）
int rootIndexFromKey(String key) {
  final first = key.split('-').first;
  return int.tryParse(first) ?? 0;
}

bool isChild(String key) => key.contains('-');

/// 取父層 key（"1-0-2" → "1-0"，"0" → null）
String? parentOf(String key) {
  final i = key.lastIndexOf('-');
  if (i < 0) return null;
  return key.substring(0, i);
}
