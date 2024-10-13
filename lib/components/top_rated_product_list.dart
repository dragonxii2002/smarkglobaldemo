import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/product_data.dart'; // 确保导入产品数据模型

class TopRatedProductsList extends StatelessWidget {
  final List<Product> topRatedProducts;

  TopRatedProductsList({required this.topRatedProducts});

  @override
  Widget build(BuildContext context) {
    return topRatedProducts.isEmpty
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
    );
  }
}