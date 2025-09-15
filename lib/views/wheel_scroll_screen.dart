import 'package:flutter/material.dart';
import 'package:test/widgets/tile.dart';

class WheelScrollScreen extends StatefulWidget {
  const WheelScrollScreen({super.key});

  @override
  State<WheelScrollScreen> createState() => _WheelScrollScreenState();
}

class _WheelScrollScreenState extends State<WheelScrollScreen> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  // int _selectedHour = 0;
  // int _selectedMinute = 0;
  @override
  initState() {
    super.initState();
    _hourController = FixedExtentScrollController(initialItem: 0);
    _minuteController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90,
                    child: ListWheelScrollView.useDelegate(
                      controller: _hourController,
                      // onSelectedItemChanged: (value) {
                      //   setState(() {
                      //     _selectedHour = value;
                      //   });
                      // },
                      itemExtent: 50,
                      perspective: 0.005,
                      diameterRatio: 1.2,
                      physics: FixedExtentScrollPhysics(), // 一定會停留在項目內
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 24,
                        builder: (context, index) {
                          return Tile(text: index.toString().padLeft(2, '0'));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: ListWheelScrollView.useDelegate(
                      controller: _minuteController,
                      // onSelectedItemChanged: (value) {
                      //   setState(() {
                      //     _selectedMinute = value;
                      //   });
                      // },
                      itemExtent: 50,
                      perspective: 0.005,
                      diameterRatio: 1.2,
                      physics: FixedExtentScrollPhysics(), // 一定會停留在項目內
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 60,
                        builder: (context, index) {
                          return Tile(text: index.toString().padLeft(2, '0'));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            MaterialButton(
              onPressed: () {
                final selectedHour = _hourController.selectedItem
                    .toString()
                    .padLeft(2, '0');
                final selectedMinute = _minuteController.selectedItem
                    .toString()
                    .padLeft(2, '0');
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Selected Time', textAlign: TextAlign.center),
                      actionsAlignment: MainAxisAlignment.center,
                      content: Text(
                        textAlign: TextAlign.center,
                        '$selectedHour:$selectedMinute',
                        style: TextStyle(
                          fontSize: 44,
                          color: Colors.amber[800],
                        ),
                      ),
                      actions: [
                        // 寬度填滿空間
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              color: Colors.amber,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
