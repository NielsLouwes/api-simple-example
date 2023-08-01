import 'package:api_simple_example/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() {
    return _UsersPageState();
  }
}

class _UsersPageState extends State<UsersPage> {
  List<User> users =
      []; // create a list that we set equal to the json object results key

  @override
  void initState() {
    super.initState();
    fetchUsers(); // This will call fetchUsers when the widget is initialized
  }

  void fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url); // need to parse our URI
    final response = await http.get(uri); // waiting for the response
    final body = response.body;
    final json = jsonDecode(body); // Decodes the JSON response
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((item) {
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

    setState(() {
      users = transformed;
    });
    print('fetchUsers completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
            color: Colors.amber, fontSize: 22, fontWeight: FontWeight.w500),
        title: const Text('Rest Api Call'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];
            final email = user.email;
            return ListTile(
                title:
                    Text('${user.name?.first ?? ''} ${user.name?.last ?? ''}'),
                subtitle: Text(email),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(user.picture!.thumbnail!),
                ));
          }),
        ),
      ),
    );
  }
}
