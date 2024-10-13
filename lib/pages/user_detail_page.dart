import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/app_data.dart';

class UserDetailsPage extends StatelessWidget {
  final UserData user;

  UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Password: ${user.password}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Admin: ${user.isAdmin ? "Yes" : "No"}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}