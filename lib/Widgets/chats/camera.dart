import 'package:flutter/cupertino.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black, 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.camera_fill,
              size: 100,
              color: CupertinoColors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Camera Screen (Placeholder)',
              style: TextStyle(fontSize: 24, color: CupertinoColors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Tap to open camera',
              style: TextStyle(fontSize: 16, color: CupertinoColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
