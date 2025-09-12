import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int timeLeft = 3;
  bool isCountingDown = false;
  Timer? timer;

  void _timesUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('時間到！'),
          actions: [
            TextButton(
              child: Text('確定'),
              onPressed: () {
                setState(() {
                  timeLeft = 3;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // timer method
  void tick() {
    if (timeLeft > 0) {
      timeLeft--;

      if (timeLeft == 0) {
        _timesUp(); // ✅ 一達到 0 就立即執行
        timer?.cancel();
        isCountingDown = false;
      }
    }
    setState(() {}); // 更新ui
  }

  void _startCountdown() {
    if (isCountingDown) return; // 防呆處理：已在倒數中就不再執行
    setState(() {
      isCountingDown = true;
    });

    // 一開始就先１再進入倒數
    timer = Timer.periodic(Duration(seconds: 1), (timer) => tick());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              timeLeft.toString(),
              style: TextStyle(fontSize: 60, color: Colors.blue),
            ),
            MaterialButton(
              child: Text('S T A R T', style: TextStyle(fontSize: 26)),
              color: Colors.amber,
              elevation: 2,
              onPressed: isCountingDown ? null : _startCountdown,
            ),
          ],
        ),
      ),
    );
  }
}
