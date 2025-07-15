import 'package:flutter/cupertino.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInput({
    required this.controller,
    required this.onSend,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: CupertinoColors.systemGroupedBackground,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: CupertinoColors.systemGrey4, width: 0.8),
              ),
              child: Row(
                children: [
                  Icon(CupertinoIcons.smiley, color: CupertinoColors.systemGrey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CupertinoTextField(
                      controller: controller,
                      placeholder: 'Type a message',
                      decoration: const BoxDecoration(),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      onSubmitted: (_) => onSend(), 
                    ),
                  ),
                  Icon(CupertinoIcons.paperclip, color: CupertinoColors.systemGrey),
                  const SizedBox(width: 8),
                  Icon(CupertinoIcons.camera_fill, color: CupertinoColors.systemGrey),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onSend, minimumSize: Size(40, 40),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF25D366), 
                shape: BoxShape.circle,
              ),
              child: const Icon(CupertinoIcons.arrow_up, color: CupertinoColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
