import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static const String baseUrl = 'https://tasya-app-dot-signabc-1.et.r.appspot.com'; 

  Future<List<User>> getAllUsers() async {
    final url = Uri.parse('$baseUrl/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> usersData = jsonData['data'];

      // Mapping data pengguna menjadi objek User
      List<User> users = usersData.map((userData) => User.fromJson(userData)).toList();
      return users;
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final body = {
      'username': username,
      'password': password,
    };
    final response = await http.post(url, body: json.encode(body), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final bool success = jsonData['success'];
      return success;
    } else {
      throw Exception('Failed to login');
    }
  }
}

class User {
  final String id;
  final String username;
  final String password;
  final String refreshToken;

  User({required this.id, required this.username, required this.password, required this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      refreshToken: json['refreshToken'],
    );
  }
}
