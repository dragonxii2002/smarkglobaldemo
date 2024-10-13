import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/pages/product_list_cat.dart';
import '../pages/product_list.dart';

class ProductCategories extends StatelessWidget {
  // 定义类别和对应的图片路径
  final List<String> categories = [
    '配件',
    '鞋类',
    '上衣',
    '裤子',
  ];

  final Map<String, String> categoryImages = {
    '配件': 'assets/images/accessories.png',
    '鞋类': 'assets/images/boot.png',
    '上衣': 'assets/images/clothes.png',
    '裤子': 'assets/images/pants.png',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categories.take(2).map((category) {
            return buildCategoryButton(context, category);
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categories.skip(2).take(2).map((category) {
            return buildCategoryButton(context, category);
          }).toList(),
        ),
      ],
    );
  }

  Widget buildCategoryButton(BuildContext context, String category) {
    String imagePath = categoryImages[category] ?? 'assets/images/default.png';

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  minimumSize: Size(50, 50),
                ),
                onPressed: () {
                  // 点击按钮时导航到产品列表页面
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListCatPage(category: category),
                    ),
                  );
                },
                child: null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}