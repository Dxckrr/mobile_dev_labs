import 'package:flutter/material.dart';
import 'package:frontend/classes/user.dart';
import 'package:frontend/screens/user_expanded.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:frontend/widgets/user_item.dart';

class UserList extends StatefulWidget {
  final String? userEmail;
  final String? token;
  const UserList({super.key, this.userEmail, this.token});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final _authService = AuthService();

  late Future<List<User>> usersFuture;
  @override
  void initState() {
    super.initState();
    print(widget.token);
    usersFuture = _authService.getAllUser(widget.token ?? "");
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<User>>(
        future: usersFuture,
        builder: (context, snapshot) {
          print("Snapshot data: ${snapshot.data}");
          print("Snapshot error: ${snapshot.error}");

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final users = snapshot.data;

          if (users == null || users.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return UserItem(
                user: user,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserExpanded(user: user,)),
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
