import 'package:api_simple_example/models/user.dart';
import 'package:api_simple_example/screens/user-details.dart';
import 'package:api_simple_example/services/user_api.dart';
import 'package:api_simple_example/widgets/main-drawer.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() {
    return _UsersPageState();
  }
}

class _UsersPageState extends State<UsersPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  void _selectEmployee(User user) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => UserDetailsScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
        title: const Text('Employee Directory'),
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];
            final email = user.email;
            return InkWell(
              onTap: () {
                _selectEmployee(user);
              },
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    focusColor: Colors.blue,
                    title: Text(user.fullName),
                    subtitle: Text(email),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(user.picture!.thumbnail!),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
