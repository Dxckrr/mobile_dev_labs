import 'package:flutter/material.dart';
import 'package:frontend/classes/user.dart';

class UserItem extends StatelessWidget {
  final User user;
  final VoidCallback? onTap;

  const UserItem({super.key, required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onTap,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: NetworkImage(user.photo),
                height: 70,
                width: 70,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(user.email, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
