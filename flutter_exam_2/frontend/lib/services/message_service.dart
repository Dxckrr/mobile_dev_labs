import 'dart:convert';
import 'package:frontend/classes/message.dart';
import 'package:http/http.dart' as http;

class MessageService {
  //singleton
  static final MessageService _instance = MessageService._internal();

  factory MessageService() {
    return _instance;
  }

  MessageService._internal();
  //
  static const serverUrl = "http://10.0.2.2:3000/api";
  Future<bool> sendMessage(
    String from,
    String to,
    String title,
    String body,
    String token,
  ) async {
    final url = Uri.parse("$serverUrl/messages/send");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json", "auth-token": token},
      body: jsonEncode({
        "email_from": from,
        "email_to": to,
        "tittle": title,
        "body": body,
      }),
    );

    return response.statusCode == 200;
  }

  Future<List<Message>> getMessages(String token, String email) async {
    final res = await http.get(
      Uri.parse('$serverUrl/messages/received/$email'),
      headers: {'Content-Type': 'application/json', 'auth-token': token},
    );

    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body);
      return data.map((u) => Message.fromJson(u)).toList();
    }
    return [];
  }
}
