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

  bool _menFilterSet = false;
  bool _womenFilterSet = false;

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

  List<User> get _filteredUsers {
    if (_menFilterSet && _womenFilterSet) {
      return users;
    } else if (_menFilterSet) {
      return users.where((user) => user.gender == 'male').toList();
    } else if (_womenFilterSet) {
      return users.where((user) => user.gender == 'female').toList();
    } else {
      return users;
    }
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
      drawer: MainDrawer(
        menFilterUpdate: (newFilterState) {
          setState(() {
            _menFilterSet = newFilterState;
          });
        },
        womenFilterUpdate: (newFilterState) {
          setState(() {
            _womenFilterSet = newFilterState;
          });
        },
        menFilterState: _menFilterSet,
        womenFilterState: _womenFilterSet,
        getFilteredUsers: () => _filteredUsers, // Pass the getter function here
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: _filteredUsers.length,
          itemBuilder: ((context, index) {
            final user = _filteredUsers[index];
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
                    leading: Hero(
                      tag: user.fullName,
                      child: Material(
                        shape: const CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(user.picture!.thumbnail!),
                      ),
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
