import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/card.dart';
import 'package:flutter_practice/category.dart';
import 'package:flutter_practice/item_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> banners = ['banner1.jpg', 'banner2.jpg', 'banner3.jpg'];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FlutterLogo(),
        ),
        title: Text('E-Commerce App'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Badge(label: Text('15'), child: Icon(CupertinoIcons.bell)),
          ),
        ],
      ),

      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products',
                prefixIcon: Icon(CupertinoIcons.search),
                suffixIcon: Icon(CupertinoIcons.mic),
                border: InputBorder.none,
              ),
            ),
          ),

          // Banners
          SizedBox(
            height: 150,
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              children: [
                ItemBanner(image: 'assets/Images/banner.jpg'),
                ItemBanner(image: 'assets/Images/banner.jpg'),
                ItemBanner(image: 'assets/Images/banner.jpg'),
              ],
            ),
          ),

          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                for (int index = 0; index < banners.length; index++)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: currentindex == index ? 12 : 8,
                    width: currentindex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: currentindex == index
                          ? Colors.grey
                          : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),

          ListTile(
            title: Text('Categories'),
            trailing: Text('View All', style: TextStyle(color: Colors.indigo)),
          ),

          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(
                  color: Colors.orange,
                  image: 'assets/Images/drugs.png',
                  category: 'Medicine',
                ),
                CategoryItem(
                  color: Colors.blue,
                  image: 'assets/Images/drungs.png',
                  category: 'Electronics',
                ),
                CategoryItem(
                  color: Colors.green,
                  image: 'assets/Images/drungs.png',
                  category: 'Clothing',
                ),
                CategoryItem(
                  color: Colors.blue,
                  image: 'assets/Images/drungs.png',
                  category: 'Clothing',
                ),
                CategoryItem(
                  color: Colors.orange,
                  image: 'assets/Images/drungs.png',
                  category: 'Clothing',
                ),
                CategoryItem(
                  color: Colors.blue,
                  image: 'assets/Images/drungs.png',
                  category: 'Electronics',
                ),
                CategoryItem(
                  color: Colors.green,
                  image: 'assets/Images/drungs.png',
                  category: 'Clothing',
                ),
                CategoryItem(
                  color: Colors.blue,
                  image: 'assets/Images/drungs.png',
                  category: 'Clothing',
                ),
                CategoryItem(
                  color: Colors.orange,
                  image: 'assets/Images/drungs.png',
                  category: 'Clothing',
                ),
              ],
            ),
          ),

          ListTile(
            title: Text('Products'),
            trailing: Text('View All', style: TextStyle(color: Colors.indigo)),
          ),

          GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              CardItem(title: 'Professional Camera', price: 'Rs 5000'),
              CardItem(title: 'Professional Camera', price: 'Rs 5000'),
              CardItem(title: 'Professional Camera', price: 'Rs 5000'),
              CardItem(title: 'Professional Camera', price: 'Rs 5000'),
              CardItem(title: 'Professional Camera', price: 'Rs 5000'),
              CardItem(title: 'Professional Camera', price: 'Rs 5000'),
            ],
          ),
        ],
      ),
    );
  }
}
