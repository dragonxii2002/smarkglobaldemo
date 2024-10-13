import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/pages/login_page.dart';

void main() {
  runApp(ElearningApp());
}

class ElearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Shop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}