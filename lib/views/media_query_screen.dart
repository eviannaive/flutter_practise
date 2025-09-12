import 'package:flutter/material.dart';

class MediaQueryScreen extends StatelessWidget {
  const MediaQueryScreen({super.key});

  // 當畫面發生縮放（例如你調整模擬器大小或旋轉螢幕）時，Flutter 會 重新呼叫 build()
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final MediaWidth = media.size.width;
    final MediaHeight = media.size.height;
    final aspectRatio = (MediaWidth / MediaHeight).toStringAsFixed(2);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Text(
            'Width:' + MediaQuery.of(context).size.width.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Height:' + MediaQuery.of(context).size.height.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Aspect Ratio:' + aspectRatio.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            media.orientation.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
