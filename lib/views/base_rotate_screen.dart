import 'package:flutter/material.dart';
import 'dart:math' show pi;

class BaseRotateScreen extends StatefulWidget {
  const BaseRotateScreen({super.key});

  // 覆寫 createState 方法，返回一個管理狀態的 _BaseRotateScreenState 物件。
  @override
  State<BaseRotateScreen> createState() => _BaseRotateScreenState();
}

class _BaseRotateScreenState extends State<BaseRotateScreen>
    with SingleTickerProviderStateMixin {
  // late 延後初始化，直到 initState 方法被呼叫時。
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // vsync 確保動畫只在螢幕有渲染時才執行，以節省資源。
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // 建立一個 Tween 動畫，它定義了動畫的起始值和結束值。
    // begin: 0.0 代表從 0 度開始。
    // end: 2 * pi 代表旋轉到 360 度（一個完整的圓）。
    // .animate(_controller) 是一個驅動器，用於控制動畫的播放。
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    // 讓動畫無限期地重複播放。
    _controller.repeat();
  }

  // dispose 是另一個生命週期方法，當 State 物件被銷毀時會被呼叫。
  @override
  void dispose() {
    // 釋放 AnimationController 佔用的資源。
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // AnimatedBuilder 是動畫的關鍵組件。它會監聽 _controller 的變化。
      // 當動畫值改變時，它只會重建 builder 函式中的部分，這效率更高。
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            // Matrix4.identity() 建立一個初始的單位矩陣（沒有任何變換）。
            // Z 軸旋轉，旋轉角度來自 _animation 的當前值。
            transform: Matrix4.identity()..rotateZ(_animation.value),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
