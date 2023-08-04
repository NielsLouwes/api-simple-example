import 'package:api_simple_example/models/user.dart';
import 'package:api_simple_example/widgets/employee-info.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Page',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Hero(
                          tag: user.fullName,
                          child: Material(
                            shape: const CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(user.picture!.large!),
                          ),
                        ),
                      ),
                      EmployeeDetails(user: user)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
