import 'package:flutter/material.dart';
import 'package:frontend/classes/message.dart';
import 'package:frontend/services/message_service.dart';
import 'package:frontend/widgets/message_item.dart';

class MessagesReceivedPage extends StatefulWidget {
  final String userEmail;
  final String token;
  const MessagesReceivedPage({
    super.key,
    required this.userEmail,
    required this.token,
  });

  @override
  State<MessagesReceivedPage> createState() => _MessagesReceivedPageState();
}

class _MessagesReceivedPageState extends State<MessagesReceivedPage> {
  final _messagesService = MessageService();

  late Future<List<Message>> messagesFuture;
  @override
  void initState() {
    super.initState();
    print(widget.token);
    messagesFuture = _messagesService.getMessages(
      widget.token,
      widget.userEmail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Message>>(
        future: messagesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final messages = snapshot.data;
          print(messages);

          if (messages == null || messages.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return MessageItem(
                message: message,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(message.tittle),
                      content: Text(message.body),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
