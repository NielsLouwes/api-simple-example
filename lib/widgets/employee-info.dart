import 'package:api_simple_example/models/user.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  final User user;

  const EmployeeDetails({super.key, required this.user});

  String get genderText {
    return user.gender[0].toUpperCase() + user.gender.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          user.fullName,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 15),
        const Text("Work Email"),
        Text(user.email),
        const SizedBox(height: 15),
        const Text("Location"),
        Text('${user.location.city} , ${user.location.country}'),
        const SizedBox(height: 15),
        const Text("Sex"),
        Text(genderText),
        const SizedBox(height: 15),
        const Text("Age"),
        Text(user.age?.toString() ?? '')
      ],
    );
  }
}
