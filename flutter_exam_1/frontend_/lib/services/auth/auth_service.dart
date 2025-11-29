import 'dart:convert';
import 'package:frontend_/services/db/database_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const serverUrl = "http://10.0.2.2:3000/api";
  Future<Map<String, dynamic>> login(String email, String password) async {
    final res = await http.post(
      Uri.parse('$serverUrl/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (res.statusCode == 200) {
      return {'token': jsonDecode(res.body)['token']};
    } else {
      return {'token': 'error'};
    }
  }

  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('auth-token');
    await DatabaseService.instance.clearFavorites();
  }

  Future<void> saveToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('auth-token', token);
  }

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('auth-token');
  }

  Future<String?> getServerValidation(String token) async {
    final res = await http.get(
      Uri.parse('$serverUrl/auth/validate'),
      headers: {'Content-Type': 'application/json', 'auth-token': token},
    );
    if (res.statusCode == 200) {
      print(res.body);
      return jsonDecode(res.body)['email'];
    } else {
      return null;
    }
  }
}
