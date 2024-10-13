import 'package:flutter/material.dart';

class CheckOutPage extends StatelessWidget {
  final double total;

  CheckOutPage({required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('结算'),
      ),
      body: Center(
        child: Text(
          '总金额: \$${total.toStringAsFixed(2)}', // 显示传递的总金额
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}