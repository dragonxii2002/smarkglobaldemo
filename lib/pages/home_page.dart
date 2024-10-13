import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarkglobaldemoapp/app_data/app_data.dart';
import 'package:smarkglobaldemoapp/app_data/product_data.dart';
import 'package:smarkglobaldemoapp/components/components.dart';
import 'package:smarkglobaldemoapp/pages/landingpage.dart';
import 'package:smarkglobaldemoapp/pages/product_list.dart';
import 'package:smarkglobaldemoapp/pages/shopping_cart.dart';
import 'package:smarkglobaldemoapp/pages/user_detail_page.dart';

class HomePage extends StatefulWidget {
  final UserData user;

  HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String appBarTitle = 'Home';

  final List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    //_pages.add(Center(child: Text('Welcome, ${widget.user.username}!')));
    pages.add(LandingPage(user: widget.user));
    pages.add(ProductListPage());
    pages.add(ShoppingCartPage());
    pages.add(UserDetailsPage(user: widget.user));
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      appBarTitle = _getAppBarTitle(index);
    });
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Product List';
      case 2:
        return 'Shopping Cart';
      case 3:
        return 'User Details';
      default:
        return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Product> topRatedProducts = products.where((product) => product.rating == 5.0).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle), // 使用当前的标题
      ),
      body: pages[selectedIndex],
      // 根据索引显示相应页面
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Product List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User Details',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}