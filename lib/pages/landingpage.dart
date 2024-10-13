import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/app_data.dart'; // 确保导入 UserData 和产品数据
import 'package:smarkglobaldemoapp/app_data/product_data.dart'; // 确保导入产品数据

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
            topRatedProducts.isEmpty
                ? Center(child: Text('No top-rated products available.')) // 如果没有产品，显示消息
                : Expanded( // 使用 Expanded 包裹 ListView 以适应剩余空间
              child: ListView.builder(
                itemCount: topRatedProducts.length,
                itemBuilder: (context, index) {
                  final product = topRatedProducts[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network(
                            product.imageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 100,
                                height: 100,
                                color: Colors.grey[300], // 占位符背景色
                                child: Icon(Icons.image, color: Colors.grey), // 占位符图标
                              );
                            },
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(product.description),
                                SizedBox(height: 5),
                                Text(
                                  '分类: ${product.category}', // 显示产品分类
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '评分: ${product.rating.toStringAsFixed(1)}', // 显示评分
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10), // 列表和按钮之间的间隔
            Text(
              'Product Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // 类别标题样式
            ),
            SizedBox(height: 10), // 类别标题和按钮之间的间隔
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: categories.take(2).map((category) {
                    return Column(
                      children: [
                        // 使用 Stack 来组合图标和文本
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              categoryImages[category] ?? 'assets/images/default.png', // 替换为实际的图片路径
                              width: 50,
                              height: 50,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0), // 取消按钮内边距
                                minimumSize: Size(60, 60), // 设置最小尺寸
                              ),
                              onPressed: () {
                                // TODO: 添加按钮点击处理逻辑，例如导航到相应的类别页面
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(category),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(height: 10), // 行之间的间隔
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: categories.skip(2).take(2).map((category) {
                    return Column(
                      children: [
                        // 使用 Stack 来组合图标和文本
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              categoryImages[category] ?? 'assets/images/default.png', // 替换为实际的图片路径
                              width: 50,
                              height: 50,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0), // 取消按钮内边距
                                minimumSize: Size(60, 60), // 设置最小尺寸
                              ),
                              onPressed: () {
                                // TODO: 添加按钮点击处理逻辑，例如导航到相应的类别页面
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(category),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}