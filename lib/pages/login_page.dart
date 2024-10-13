import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/app_data.dart';
import 'package:smarkglobaldemoapp/components/components.dart';
import 'home_page.dart';
import 'registration_page.dart'; // 导入 RegistrationPage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // 检查用户名和密码是否在用户列表中
    UserData? user = users.firstWhere(
          (user) => user.username == username && user.password == password,
    );

    if (user != null) {
      // 导航到 HomePage，并传递用户信息
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    } else {
      // 弹出错误提示
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid username or password.'),
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
    }
  }

  void _showPassword() {
    String username = _usernameController.text;

    // 查找用户名对应的用户
    UserData? user = users.firstWhere((user) => user.username == username);

    // 检查用户是否存在
    if (user != null) {
      // 弹出提示显示对应的密码
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Your Password'),
            content: Text('Username: ${user.username}\nPassword: ${user.password}'),
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
      // 弹出错误提示：用户名不存在
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Username not found.'),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView( // 添加滚动视图
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 使用本地图片作为公司logo
                Image.asset('assets/images/Logo.png', height: 100),

                SizedBox(height: 40), // 间隔

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
                SizedBox(height: 36), // 间隔

                // 登录按钮
                LoginPageButton(
                  text: 'Sign In',
                  onPressed: _signIn,
                ),

                SizedBox(height: 30),

                LoginPageButton(
                  text: 'Register',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationPage()),
                    );
                  },
                ),

                SizedBox(height: 16), // 间隔

                // 忘记密码按钮
                TextButton(
                  onPressed: _showPassword,
                  child: Text('Forget Password?', style: AppTextStyles.loginPageButtonTextStyle(color: Colors.cyan)),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}