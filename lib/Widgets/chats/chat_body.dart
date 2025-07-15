import 'package:flutter/cupertino.dart';
import 'package:whats_app/Widgets/chats/message_bubble.dart';
import 'package:whats_app/Widgets/chats/message_input.dart';


class ChatBody extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final TextEditingController messageController;
  final VoidCallback onSendMessage;

  const ChatBody({
    required this.messages,
    required this.messageController,
    required this.onSendMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE5DDD5), 
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: messages[index]['text'],
                  time: messages[index]['time'],
                  isSent: messages[index]['isSent'],
                );
              },
            ),
          ),
          MessageInput(
            controller: messageController,
            onSend: onSendMessage,
          ),
        ],
      ),
    );
  }
}
