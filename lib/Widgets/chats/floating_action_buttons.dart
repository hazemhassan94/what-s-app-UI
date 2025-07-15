import 'package:flutter/cupertino.dart';
import 'package:whats_app/Home_Screen/Screens/chat_screen.dart';


class ChatFloatingActionButton extends StatelessWidget {
  final BuildContext context;

  const ChatFloatingActionButton({required this.context, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
       
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => const ChatScreen(
              name: 'New Contact',
              avatar: 'NC',
              isOnline: false,
            ),
          ),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF25D366), 
          shape: BoxShape.circle,
        ),
        child: const Icon(CupertinoIcons.pencil_outline, color: CupertinoColors.white, size: 28), 
      ),
    );
  }
}

class StatusFloatingActionButton extends StatelessWidget {
  const StatusFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey5,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(CupertinoIcons.pencil, color: CupertinoColors.systemGrey),
          ),
        ),
        const SizedBox(height: 10),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFF25D366), 
              shape: BoxShape.circle,
            ),
            child: const Icon(CupertinoIcons.camera_fill, color: CupertinoColors.white, size: 28),
          ),
        ),
      ],
    );
  }
}

class CallFloatingActionButton extends StatelessWidget {
  const CallFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => const ChatScreen(
              name: 'New Call',
              avatar: 'NC',
              isOnline: false,
            ),
          ),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF25D366), 
          shape: BoxShape.circle,
        ),
        child: const Icon(CupertinoIcons.phone_fill_badge_plus, color: CupertinoColors.white, size: 28),
      ),
    );
  }
}
