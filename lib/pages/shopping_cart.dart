import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/product_data.dart';
import 'package:smarkglobaldemoapp/pages/checkout.dart';

import '../components/components.dart';
import 'checkout.dart'; // 导入结算页面的文件

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late List<Product> filteredCartProducts;

  @override
  void initState() {
    super.initState();
    _refreshCartProducts();
  }

  void _refreshCartProducts() {
    // 过滤出数量大于 0 的产品
    List<Product> cartProducts = products.where((product) => product.quantity > 0).toList();
    filteredCartProducts = cartProducts.where((product) => product.quantity > 0).toList();
    setState(() {}); // 刷新界面
  }

  double _calculateTotal() {
    double total = 0.0;
    for (var product in filteredCartProducts) {
      total += product.price * product.quantity; // 计算每个产品的总价并累加
    }
    return total;
  }

  void _removeProduct(Product product) {
    setState(() {
      if (product.quantity > 0) {
        product.quantity--; // 每次点击减少数量
      }
      // 过滤数量大于 0 的产品，以便在界面上更新
      filteredCartProducts = filteredCartProducts.where((p) => p.quantity > 0).toList();
    });
  }

  void _checkout() {
    double total = _calculateTotal();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckOutPage(total: total), // 传递总金额到结算页面
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshCartProducts, // 点击时刷新数据
            tooltip: '刷新',
          ),
        ],
      ),
      body: filteredCartProducts.isEmpty
          ? Center(child: Text('购物车为空或没有足够的产品。'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredCartProducts.length,
              itemBuilder: (context, index) {
                final product = filteredCartProducts[index];
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
                                '数量: ${product.quantity}', // 显示数量
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _removeProduct(product), // 点击时减少数量
                          tooltip: '减少数量',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '总计: \$${_calculateTotal().toStringAsFixed(2)}', // 显示总和
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                LoginPageButton(
                  text: '结算',
                  onPressed: _checkout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}