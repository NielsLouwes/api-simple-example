import 'package:api_simple_example/models/user.dart';
import 'package:api_simple_example/services/user_api.dart';
import 'package:flutter/material.dart';

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

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];
            final email = user.email;
            return Card(
              elevation: 5,
              child: ListTile(
                title: Text(user.fullName),
                subtitle: Text(email),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(user.picture!.thumbnail!),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
