import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/product_data.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String? selectedCategory;
  String? selectedSortOrder = '价格从低到高'; // 默认排序方式

  @override
  Widget build(BuildContext context) {
    // 获取所有类别并添加“全部”选项
    Set<String> categories = products.map((product) => product.category).toSet();
    List<String> categoryList = ['全部'] + categories.toList(); // 将“全部”放在首位

    // 按类别过滤产品
    List<Product> filteredProducts = selectedCategory == null || selectedCategory == '全部'
        ? products
        : products.where((product) => product.category == selectedCategory).toList();

    // 根据选择的排序方式排序产品
    if (selectedSortOrder == '价格从低到高') {
      filteredProducts.sort((a, b) => a.price.compareTo(b.price));
    } else if (selectedSortOrder == '价格从高到低') {
      filteredProducts.sort((a, b) => b.price.compareTo(a.price));
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('行山用品'),
        actions: [
          DropdownButton<String>(
            hint: Text('选择类别'),
            value: selectedCategory,
            items: categoryList.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value; // 更新选择的类别
              });
            },
          ),
          SizedBox(width: 20), // 添加间隔
          DropdownButton<String>(
            hint: Text('排序'),
            value: selectedSortOrder,
            items: [
              DropdownMenuItem<String>(
                value: '价格从低到高',
                child: Text('价格从低到高'),
              ),
              DropdownMenuItem<String>(
                value: '价格从高到低',
                child: Text('价格从高到低'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedSortOrder = value; // 更新选择的排序方式
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
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
                        SizedBox(height: 5),
                        Text(
                          '评分: ${product.rating.toStringAsFixed(1)}', // 显示评分
                          style: TextStyle(color: Colors.orange),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            // 增加产品数量
                            setState(() {
                              product.quantity++; // 每次点击增加数量
                            });
                            // 记录购买信息
                            print("购买: ${product.name}, 价格: \$${product.price}, 数量: ${product.quantity}");
                          },
                          child: Text('购买'),
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