import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/app_data.dart';
import 'package:smarkglobaldemoapp/components/components.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // 检查用户名是否已存在
    bool userExists = users.any((user) => user.username == username);

    if (userExists) {
      // 弹出错误提示：用户名已存在
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Username already exists.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // 添加新用户到用户列表
      users.add(UserData(username, password));
      Navigator.pop(context); // 返回到登录页面
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 用户名输入框
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'User Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16), // 间隔

              // 密码输入框
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24), // 间隔
              LoginPageButton(
                text: 'Register',
                onPressed: _register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}