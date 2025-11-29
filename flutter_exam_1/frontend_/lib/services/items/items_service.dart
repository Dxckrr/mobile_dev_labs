import 'dart:convert';
import 'package:http/http.dart' as http;

class ItemsService {
  static const serverUrl = "http://10.0.2.2:3000/api";
  Future<List<dynamic>> fetchItems(String token) async {
    final res = await http.get(
      Uri.parse('$serverUrl/items/user'),
      headers: {'Content-Type': 'application/json', 'auth-token': token},
    );
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
      return jsonDecode(res.body);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<void> syncFavoritesToBackend(String token, List<int> favorites) async {
    final response = await http.post(
      Uri.parse('$serverUrl/items/sync_favorites'),
      headers: {"Content-Type": "application/json", "auth-token": token},
      body: jsonEncode({"favorites": favorites}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to sync favorites: ${response.body}");
    }
  }
}
