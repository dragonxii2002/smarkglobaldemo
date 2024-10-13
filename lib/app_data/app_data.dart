import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserData {
  String username;
  String password;
  bool isAdmin; // 新增字段

  UserData(this.username, this.password, {this.isAdmin = false}); // 默认值为 false
}

// 示例用户列表
List<UserData> users = [
  UserData("admin", "adminpass", isAdmin: true),
  UserData("user1", "password1"),
  UserData("user2", "password2"),
  UserData("user3", "password3"),
];

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  void _removeUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void _editUser(int index) {
    final usernameController = TextEditingController(text: users[index].username);
    final passwordController = TextEditingController(text: users[index].password);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // 更新用户信息
                  users[index].username = usernameController.text;
                  users[index].password = passwordController.text;
                });
                Navigator.of(context).pop(); // 关闭对话框
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].username),
            subtitle: Text('Password: ${users[index].password}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue), // 编辑图标
                  onPressed: () {
                    _editUser(index); // 调用编辑用户方法
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red), // 删除图标
                  onPressed: () {
                    // 弹出确认对话框
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Confirm Delete'),
                          content: Text('Are you sure you want to remove ${users[index].username}?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // 取消
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                _removeUser(index); // 删除用户
                                Navigator.of(context).pop(); // 关闭对话框
                              },
                              child: Text('Remove'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}