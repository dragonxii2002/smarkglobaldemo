import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/app_data.dart'; // 确保导入 UserData 和产品数据
import 'package:smarkglobaldemoapp/app_data/product_data.dart';

import '../components/product_categories.dart';
import '../components/top_rated_product_list.dart'; // 确保导入产品数据

class LandingPage extends StatelessWidget {
  final UserData user;

  LandingPage({required this.user});

  // 创建一个映射，将产品类别与相应的本地图片路径关联
  final Map<String, String> categoryImages = {
    '配件': 'assets/images/accessories.png',
    '鞋类': 'assets/images/boot.png',
    '上衣': 'assets/images/clothes.png',
    '裤子': 'assets/images/pants.png',
    // 添加更多类别和图片路径
  };

  @override
  Widget build(BuildContext context) {
    List<Product> topRatedProducts = products.where((product) => product.rating >= 5.0).toList();

    // 获取所有产品类别
    Set<String> categories = products.map((product) => product.category).toSet();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome, ${user.username}!'), // 显示用户名
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // 添加一些内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 让标题左对齐
          children: [
            Text(
              'Top Rated Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // 标题样式
            ),
            SizedBox(height: 10), // 标题和列表之间的间隔
            Text(
              '我们是一家专门提供行山和露营用品的公司，为您提供各种高品质的户外装备。', // 公司简介
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10), // 简介和列表之间的间隔
            TopRatedProductsList(topRatedProducts: topRatedProducts),
            SizedBox(height: 10), // 列表和按钮之间的间隔
            Text(
              'Product Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // 类别标题样式
            ),
            SizedBox(height: 10), // 类别标题和按钮之间的间隔
            ProductCategories(),
          ],
        ),
      ),
    );
  }
}