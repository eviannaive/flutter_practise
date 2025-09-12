import 'package:flutter/material.dart';
import 'package:test/core/screens/screen_item.dart';
import 'package:test/core/screens/screen_manager.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  static _RootScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_RootScreenState>();

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  /// 以「key」表示目前選中的節點。預設選第一個根節點（key: "0"）
  String _selectedKey = '0';

  /// 由 key 取到節點；失敗則回退到第一個根
  ScreenItem get _selectedNode =>
      ScreenManager.findByKey(_selectedKey) ??
      ScreenManager.bottomNavScreens.first;

  /// 切換到底部導航的第 i 個（i 是 bottomNav 的 index）
  void _onBottomTapped(int i) {
    final bottomRootIndices = ScreenManager.bottomNavIndices; // List<int>
    if (i < 0 || i >= bottomRootIndices.length) return;
    final rootIndex = bottomRootIndices[i];
    setState(() {
      _selectedKey = '$rootIndex'; // 點底部 → 選到該根群組本身
    });
  }

  /// 點 Drawer 任一節點
  void onPickNode(String key) {
    setState(() => _selectedKey = key);
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomRoots =
        ScreenManager.bottomNavScreens; // List<ScreenItem> (roots)
    final bottomRootIndices = ScreenManager.bottomNavIndices; // List<int>

    // 將目前選中節點的根，對映到 bottomNav 的 currentIndex
    final rootIndex = ScreenManager.rootIndexFromKey(
      _selectedKey,
    ); // 例如 "2-1-0" → 2
    final currentBottomIndex = bottomRootIndices.indexOf(rootIndex);

    // 往上返回一層（"1-0-2" → "1-0"；"0-1" → "0"）
    void _goUpOneLevel() {
      final i = _selectedKey.lastIndexOf('-');
      if (i == -1) return; // 已經在根
      setState(() => _selectedKey = _selectedKey.substring(0, i));
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: Icon(
              ScreenManager.isChild(_selectedKey) ? Icons.arrow_back_ios : null,
            ),
            onPressed: () {
              if (ScreenManager.isChild(_selectedKey)) {
                _goUpOneLevel(); // 只在子項時「往上」而不是 pop route
              }
            },
          ),
        ),
        title: Text(_selectedNode.label),
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.grey[100],
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text('Drawer Header', style: TextStyle(fontSize: 30)),
                ),
              ),
              // 一層層遞迴把整棵樹畫出來（只針對根清單）
              for (final root in ScreenManager.screens)
                _NodeTile(
                  node: root,
                  selectedKey: _selectedKey,
                  onPick: onPickNode,
                  initiallyExpanded:
                      ScreenManager.rootIndexFromKey(_selectedKey) ==
                      ScreenManager.screens.indexOf(root),
                ),
            ],
          ),
        ),
      ),
      body: _selectedNode.screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentBottomIndex,
        type: BottomNavigationBarType.fixed, // 四個以上要加這個
        onTap: _onBottomTapped,
        backgroundColor: theme.colorScheme.primaryContainer,
        items: [
          for (final r in bottomRoots)
            BottomNavigationBarItem(icon: Icon(r.icon), label: r.label),
        ],
      ),
    );
  }
}

/// 遞迴元件：群組用 ExpansionTile；葉節點用 ListTile
class _NodeTile extends StatelessWidget {
  final ScreenItem node;
  final String selectedKey;
  final ValueChanged<String> onPick;
  final bool initiallyExpanded;

  const _NodeTile({
    required this.node,
    required this.selectedKey,
    required this.onPick,
    this.initiallyExpanded = false,
  });

  bool _containsSelected(ScreenItem n, String key) {
    if (n.key == key) return true;
    final kids = n.children;
    if (kids == null || kids.isEmpty) return false;
    for (final c in kids) {
      if (_containsSelected(c, key)) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = node.key == selectedKey;

    // 葉節點
    if (node.isLeaf) {
      return ListTile(
        leading: Icon(
          node.icon,
          color: isSelected ? Theme.of(context).colorScheme.primary : null,
        ),
        title: Text(
          node.label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Theme.of(context).colorScheme.primary : null,
          ),
        ),
        selected: isSelected,
        onTap: () => onPick(node.key),
      );
    }

    // 群組節點
    final kids = node.children ?? const <ScreenItem>[];
    final expanded = initiallyExpanded || _containsSelected(node, selectedKey);

    return ExpansionTile(
      leading: Icon(
        node.icon,
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
      ),
      title: Text(
        node.label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          color: isSelected ? Theme.of(context).colorScheme.primary : null,
        ),
      ),
      initiallyExpanded: expanded,
      children: [
        // 若群組本身也有畫面，給一個 Overview 讓使用者可點群組自己
        if (node.screen case final _?) //case final _? 不是 null 就符合
          ListTile(
            leading: const Icon(Icons.all_inbox_outlined),
            title: const Text('Overview'),
            selected: isSelected,
            onTap: () => onPick(node.key),
          ),
        for (final c in kids)
          _NodeTile(node: c, selectedKey: selectedKey, onPick: onPick),
      ],
    );
  }
}
