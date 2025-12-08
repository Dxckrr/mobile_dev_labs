import 'package:flutter/material.dart';
import 'package:frontend/classes/message.dart';

class MessageItem extends StatelessWidget {
  final Message message;
  final VoidCallback? onTap;

  const MessageItem({super.key, required this.message, this.onTap});
  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return "${date.day}/${date.month}/${date.year} "
          "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return isoDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _formatDate(message.date);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              const Icon(
                Icons.mark_email_unread,
                size: 32,
                color: Colors.blueAccent,
              ),
              const SizedBox(width: 16),

              // Text Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.emailFrom,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message.tittle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
