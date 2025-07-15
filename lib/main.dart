import 'package:flutter/cupertino.dart';
import 'package:whats_app/Home_Screen/Screens/home_screen.dart';

void main() {
  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'WhatsApp',
      theme: CupertinoThemeData(
        primaryColor: Color(0xFF075E54), 
        scaffoldBackgroundColor: CupertinoColors.white,
        barBackgroundColor: CupertinoColors.white, 
        textTheme: CupertinoTextThemeData(
          navTitleTextStyle: TextStyle(color: CupertinoColors.black, fontWeight: FontWeight.w600),
          navActionTextStyle: TextStyle(color: Color(0xFF075E54)), 
          navLargeTitleTextStyle: TextStyle(color: CupertinoColors.black, fontWeight: FontWeight.w700),
        ),
      ),
      home: WhatsAppHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
