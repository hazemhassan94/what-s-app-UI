import 'package:flutter/cupertino.dart';
import 'package:whats_app/Home_Screen/Screens/chat_screen.dart';
import 'package:whats_app/Widgets/chats/camera.dart';
import 'package:whats_app/Widgets/chats/calls.dart';
import 'package:whats_app/Widgets/chats/status.dart'; 
class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ChatScreen(),
    const StatusScreen(),
    const CallsScreen(),
    const CameraScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          _getTitle(_selectedIndex),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: CupertinoColors.black),
        ),
        backgroundColor: CupertinoColors.white,
        border: const Border(bottom: BorderSide(color: CupertinoColors.lightBackgroundGray, width: 0.0)),
        trailing: _selectedIndex == 0
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(CupertinoIcons.search, color: CupertinoColors.black),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(CupertinoIcons.ellipsis_vertical, color: CupertinoColors.black),
                  ),
                ],
              )
            : null,
      ),
      child: SafeArea( 
        child: Column(
          children: [
            Expanded(
              child: _screens[_selectedIndex],
            ),
            _buildCupertinoTabBar(),
          ],
        ),
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Chats';
      case 1:
        return 'Status';
      case 2:
        return 'Calls';
      case 3:
        return 'Camera';
      default:
        return 'WhatsApp';
    }
  }

  Widget _buildCupertinoTabBar() {
    return Container(
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
        border: Border(top: BorderSide(color: CupertinoColors.lightBackgroundGray, width: 0.0)),
      ),
      child: CupertinoTabBar(
        currentIndex: _selectedIndex,
        activeColor: const Color(0xFF075E54), 
        inactiveColor: CupertinoColors.systemGrey,
        backgroundColor: CupertinoColors.white,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.circle_fill),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone_fill),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.camera_fill),
            label: 'Camera',
          ),
        ],
      ),
    );
  }
}
