import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/product_data.dart'; // 假设产品数据在这个文件中

class ProductListCatPage extends StatelessWidget {
  final String category;

  ProductListCatPage({required this.category});

  @override
  Widget build(BuildContext context) {
    // 根据类别过滤产品
    List<Product> filteredProducts = products.where((product) => product.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category 产品'),
      ),
      body: filteredProducts.isEmpty
          ? Center(child: Text('没有可用的产品。')) // 处理没有产品的情况
          : ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
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
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
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