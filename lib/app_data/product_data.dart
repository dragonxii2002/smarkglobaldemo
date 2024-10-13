import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  final String tag;

  const Category({required this.tag});
}

final List<Category> categories = [
  const Category(
    tag: '配件',
  ),
  const Category(
    tag: '上衣',
  ),
  const Category(
    tag: '鞋类',
  ),
  const Category(
    tag: '裤子',
  ),
];

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  int quantity;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
    this.quantity = 0,
  });
}

final List<Product> products = [
  Product(
    name: '登山背包6',
    description: '适合长途徒步旅行的轻便背包。',
    price: 299.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/29473001_gray/29473001-0-700x700.jpg',
    category: '配件',
    rating: 5,
    quantity: 0,
  ),
  Product(
    name: '登山背包1',
    description: '适合长途徒步旅行的轻便背包。',
    price: 249.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/29473001_gray/29473001-0-700x700.jpg',
    category: '配件',
    rating: 4,
    quantity: 0,
  ),
  Product(
    name: '登山背包2',
    description: '适合长途徒步旅行的轻便背包。',
    price: 319.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/29473001_gray/29473001-0-700x700.jpg',
    category: '配件',
    rating: 3,
    quantity: 0,
  ),
  Product(
    name: '登山背包3',
    description: '适合长途徒步旅行的轻便背包。',
    price: 259.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/29473001_gray/29473001-0-700x700.jpg',
    category: '配件',
    rating: 4,
    quantity: 0,
  ),
  Product(
    name: '登山背包4',
    description: '适合长途徒步旅行的轻便背包。',
    price: 279.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/29473001_gray/29473001-0-700x700.jpg',
    category: '配件',
    rating: 3,
    quantity: 0,
  ),
  Product(
    name: '登山背包5',
    description: '适合长途徒步旅行的轻便背包。',
    price: 399.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/29473001_gray/29473001-0-700x700.jpg',
    category: '配件',
    rating: 4,
    quantity: 0,
  ),
  Product(
    name: '登山靴1',
    description: '耐磨防水的登山靴，确保舒适与安全。',
    price: 499.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42508001_36_yards/42508001_36_yards_h_5-700x700.jpg',
    category: '鞋类',
    rating: 2,
    quantity: 0,
  ),
  Product(
    name: '登山靴2',
    description: '耐磨防水的登山靴，确保舒适与安全。',
    price: 759.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42508001_36_yards/42508001_36_yards_h_5-700x700.jpg',
    category: '鞋类',
    rating: 1,
    quantity: 0,
  ),
  Product(
    name: '登山靴3',
    description: '耐磨防水的登山靴，确保舒适与安全。',
    price: 899.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42508001_36_yards/42508001_36_yards_h_5-700x700.jpg',
    category: '鞋类',
    rating: 3,
    quantity: 0,
  ),
  Product(
    name: '登山靴4',
    description: '耐磨防水的登山靴，确保舒适与安全。',
    price: 1099.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42508001_36_yards/42508001_36_yards_h_5-700x700.jpg',
    category: '鞋类',
    rating: 4,
    quantity: 0,
  ),
  Product(
    name: '登山靴5',
    description: '耐磨防水的登山靴，确保舒适与安全。',
    price: 699.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42508001_36_yards/42508001_36_yards_h_5-700x700.jpg',
    category: '鞋类',
    rating: 5,
    quantity: 0,
  ),
  Product(
    name: '睡袋1',
    description: '适合各种气候的高性能睡袋。',
    price: 499.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/MDY28256/MDY28256-5-700x700.jpg',
    category: '配件',
    rating: 1,
    quantity: 0,
  ),
  Product(
    name: '睡袋2',
    description: '适合各种气候的高性能睡袋。',
    price: 559.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/MDY28256/MDY28256-5-700x700.jpg',
    category: '配件',
    rating: 3,
    quantity: 0,
  ),
  Product(
    name: '睡袋3',
    description: '适合各种气候的高性能睡袋。',
    price: 339.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/MDY28256/MDY28256-5-700x700.jpg',
    category: '配件',
    rating: 4,
    quantity: 0,
  ),
  Product(
    name: '睡袋4',
    description: '适合各种气候的高性能睡袋。',
    price: 229.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/MDY28256/MDY28256-5-700x700.jpg',
    category: '配件',
    rating: 3,
    quantity: 0,
  ),
  Product(
    name: '睡袋5',
    description: '适合各种气候的高性能睡袋。',
    price: 699.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/MDY28256/MDY28256-5-700x700.jpg',
    category: '配件',
    rating: 4,
    quantity: 0,
  ),
  Product(
    name: '睡袋6',
    description: '适合各种气候的高性能睡袋。',
    price: 799.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/MDY28256/MDY28256-5-700x700.jpg',
    category: '配件',
    rating: 2,
    quantity: 0,
  ),
  Product(
    name: '防水雨衣1',
    description: '轻便舒适的速干上衣，适合各种天气。',
    price: 199.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/37489001/37489001-700x700.jpg',
    category: '上衣',
    rating: 1,
    quantity: 0,
  ),
  Product(
    name: '防水雨衣2',
    description: '轻便舒适的速干上衣，适合各种天气。',
    price: 99.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/37489001/37489001-700x700.jpg',
    category: '上衣',
    rating: 3,
    quantity: 0,
  ),
  Product(
    name: '防水雨衣3',
    description: '轻便舒适的速干上衣，适合各种天气。',
    price: 159.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/37489001/37489001-700x700.jpg',
    category: '上衣',
    rating: 4,
    quantity: 0,
  ),
  Product(
    name: '防水雨衣4',
    description: '轻便舒适的速干上衣，适合各种天气。',
    price: 149.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/37489001/37489001-700x700.jpg',
    category: '上衣',
    rating: 3,
    quantity: 0,
  ),
  Product(
    name: '防水雨衣5',
    description: '轻便舒适的速干上衣，适合各种天气。',
    price: 179.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/37489001/37489001-700x700.jpg',
    category: '上衣',
    rating: 5,
    quantity: 0,
  ),
  Product(
    name: '登山裤1',
    description: '耐磨的登山裤，确保活动自如。',
    price: 399.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42235001/42235001-700x700.jpg',
    category: '裤子',
    rating: 1,
    quantity: 0,
  ),
  Product(
    name: '登山裤2',
    description: '耐磨的登山裤，确保活动自如。',
    price: 499.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42235001/42235001-700x700.jpg',
    category: '裤子',
    rating: 4,
    quantity: 0,
  ),
  Product(
    name: '登山裤3',
    description: '耐磨的登山裤，确保活动自如。',
    price: 599.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42235001/42235001-700x700.jpg',
    category: '裤子',
    rating: 2,
    quantity: 0,
  ),
  Product(
    name: '登山裤4',
    description: '耐磨的登山裤，确保活动自如。',
    price: 699.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42235001/42235001-700x700.jpg',
    category: '裤子',
    rating: 3,
    quantity: 0,
  ),
  Product(
    name: '登山裤5',
    description: '耐磨的登山裤，确保活动自如。',
    price: 779.99,
    imageUrl: 'https://shop.outletexpress.com.hk/image/cache/catalog/42235001/42235001-700x700.jpg',
    category: '裤子',
    rating: 1,
    quantity: 0,
  ),
];
