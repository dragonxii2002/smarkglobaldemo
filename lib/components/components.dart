import 'package:flutter/material.dart';

// 自定义按钮组件
class LoginPageButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LoginPageButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // 设置固定宽度
      height: 50, // 设置固定高度
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // 按钮文本颜色
          backgroundColor: AppColors.primaryColor, // 按钮背景颜色
          padding: EdgeInsets.zero, // 不需要额外内边距
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // 圆角边框
          ),
          elevation: 10, // 阴影效果
        ),
        child: Text(
          text,
          style: AppTextStyles.loginPageButtonTextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AppTextStyles {
  static TextStyle loginPageButtonTextStyle({Color color = Colors.white}) {
    return TextStyle(
      fontSize: 18, // 字体大小
      fontWeight: FontWeight.bold, // 字体粗细
      color: color, // 文本颜色
    );
  }
}

class AppColors{
  static Color primaryColor = const Color(0xFFFFB81C);
}