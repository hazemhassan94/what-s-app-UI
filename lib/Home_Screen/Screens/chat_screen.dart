
import 'package:flutter/cupertino.dart';
import 'package:whats_app/Widgets/chats/chat_app_bar.dart';
import 'package:whats_app/Widgets/chats/chat_body.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String avatar;
  final bool isOnline;

  const ChatScreen({
    this.name = 'hazem',
    this.avatar = '',
    this.isOnline = true,
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hey! How are you doing?',
      'time': '12:30 PM',
      'isSent': false,
    },
    {
      'text': 'I am good, thanks! How about you?',
      'time': '12:32 PM',
      'isSent': true,
    },
    {
      'text': 'I am doing great too! Just chilling.',
      'time': '12:35 PM',
      'isSent': false,
    },
  ];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add({
          'text': _messageController.text,
          'time': '${DateTime.now().hour % 12 == 0 ? 12 : DateTime.now().hour % 12}:${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour >= 12 ? 'PM' : 'AM'}',
          'isSent': true,
        });
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: ChatAppBar(
          name: widget.name,
          avatar: widget.avatar,
          isOnline: widget.isOnline,
        ),
      ),
      child: SafeArea(
        child: ChatBody(
          messages: messages,
          messageController: _messageController,
          onSendMessage: _sendMessage,
        ),
      ),
    );
  }
}
