import 'dart:convert';
import 'package:frontend/classes/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //singleton
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();
  //
  static const serverUrl = "http://10.0.2.2:3000/api";
  Future<Map<String, dynamic>> login(
    String email,
    String password,
    String tokenFCM,
  ) async {
    final res = await http.post(
      Uri.parse('$serverUrl/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'token_FCM': tokenFCM,
      }),
    );
    if (res.statusCode == 200) {
      return {'token': jsonDecode(res.body)['token']};
    } else {
      return {'token': 'error'};
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<void> saveToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('auth-token', token);
  }

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('auth-token');
  }

  Future<List<User>> getAllUser(String token) async {
    final res = await http.get(
      Uri.parse('$serverUrl/auth/users'),
      headers: {'Content-Type': 'application/json', 'auth-token': token},
    );

    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body);
      return data.map((u) => User.fromJson(u)).toList();
    }
    return [];
  }
}
