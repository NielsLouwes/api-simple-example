import 'package:api_simple_example/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url); // need to parse our URI
    final response = await http.get(uri); // waiting for the response
    final body = response.body;
    final json = jsonDecode(body); // Decodes the JSON response
    final results = json['results'] as List<dynamic>;
    final users = results.map((item) {
      final name = UserName(
          title: item['name']['title'],
          first: item['name']['first'],
          last: item['name']['last']);

      final thumbnail = Picture(thumbnail: item['picture']['thumbnail']);

      return User(
          email: item['email'],
          gender: item['gender'],
          nationality: item['nationality'],
          name: name,
          picture: thumbnail);
    }).toList();

    return users;
  }
}
