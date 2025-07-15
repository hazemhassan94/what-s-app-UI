import 'package:flutter/cupertino.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSent;

  const MessageBubble({
    required this.message,
    required this.time,
    required this.isSent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSent ? const Color(0xFFDCF8C6) : CupertinoColors.white, 
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: Radius.circular(isSent ? 15 : 5), 
            bottomRight: Radius.circular(isSent ? 5 : 15), 
          ),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message, style: const TextStyle(fontSize: 16, color: CupertinoColors.black)),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                if (isSent)
                  const SizedBox(width: 5),
                if (isSent)
                  const Icon(
                    CupertinoIcons.checkmark_alt, 
                    size: 16,
                    color: Color(0xFF25D366), 
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
