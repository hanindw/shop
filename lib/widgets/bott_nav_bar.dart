import 'package:flutter/material.dart';
import 'package:test2/pages/explore.dart';
import 'package:test2/pages/my_cart.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int currentIndex = 0;
  int selectedindex = 0;

  late PageController _pageController;
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        iconSize: 35,
        currentIndex: selectedindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Account"),
        ],
        onTap: (val) {
          setState(() {
            selectedindex = val;
            _pageController.jumpToPage(val);
          });
        },
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            ExplorePage(),
            ExplorePage(),
            Cart(),
            ExplorePage(),
            ExplorePage(),
          ]),
    );
  }
}
