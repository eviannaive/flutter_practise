import 'package:flutter/material.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({super.key});

  @override
  State<DragAndDropScreen> createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  final List myTiles = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  void _updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      // 往後拖曳因為陣列會變短，所以需要 -1
      if (oldIndex < newIndex) {
        newIndex--;
      }

      final tile = myTiles.removeAt(oldIndex);
      myTiles.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        // physics: const BouncingScrollPhysics(),
        buildDefaultDragHandles: true,
        onReorder: _updateMyTiles,
        children: [
          for (int index = 0; index < myTiles.length; index++)
            ListTile(
              key: ValueKey(myTiles[index]),
              title: Text(myTiles[index]),
              trailing: ReorderableDragStartListener(
                index: index,
                child: const Icon(Icons.drag_handle),
              ),
            ),
        ],
      ),
    );
  }
}
