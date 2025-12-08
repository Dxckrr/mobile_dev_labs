import 'package:flutter/material.dart';
import 'package:frontend/services/message_service.dart';

class MessageModal extends StatefulWidget {
  final String emailFrom;
  final String emailTo;
  final String token;

  const MessageModal({
    super.key,
    required this.emailFrom,
    required this.emailTo,
    required this.token,
  });

  @override
  State<MessageModal> createState() => _SendMessageModalState();
}

class _SendMessageModalState extends State<MessageModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final MessageService _messageService = MessageService();
  bool _isSending = false;

  Future<void> _sendMessage() async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Llena todos los campos")));
      return;
    }

    setState(() => _isSending = true);

    bool success = await _messageService.sendMessage(
      widget.emailFrom,
      widget.emailTo,
      _titleController.text,
      _bodyController.text,
      widget.token,
    );

    setState(() => _isSending = false);

    if (success) {
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Mensaje enviado ")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Error al enviar mensaje ")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enviar un mensaje",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: "Título",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            controller: _bodyController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: "Mensaje",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          Center(
            child: ElevatedButton(
              onPressed: _isSending ? null : _sendMessage,
              child: _isSending
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Enviar"),
            ),
          ),
        ],
      ),
    );
  }
}
