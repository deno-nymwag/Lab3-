import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Заміна базового URL на ваш правильний
  final String baseUrl = 'http://localhost:3000';
 // або https://your-api-server.com, якщо сервер зовнішній

  Future<dynamic> getData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<dynamic> register(String email, String password) async {
    final response = await postData('register', {
      'email': email,
      'password': password,
    });

    if (response != null) {
      return response;
    } else {
      throw Exception('Failed to register');
    }
  }
}
