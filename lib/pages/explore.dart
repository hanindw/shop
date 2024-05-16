import 'package:flutter/material.dart';
import 'package:test2/pages/beverages.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List items = [
    {
      "image": "images/pic13.png",
      "title": "Fresh Fruits & Vegetables",
    },
    {
      "image": "images/pic15.png",
      "title": "  Cooking Oil &  Ghee  ",
    },
    {
      "image": "images/pic19.png",
      "title": "     Meat & Fish      ",
    },
    {
      "image": "images/pic12.png",
      "title": "   Bakery & snacks    ",
    },
    {
      "image": "images/pic18.png",
      "title": "    Dairy & Eggs    ",
    },
    {
      "image": "images/pic5.png",
      "title": "    Beverages       ",
    },
    {
      "image": "images/pic13.png",
      "title": "Fresh Fruits & Vegetables",
    },
    {
      "image": "images/pic13.png",
      "title": "Fresh Fruits & Vegetables",
    },
  ];
  //int currentIndex = 1;
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
      appBar: AppBar(
        title: Text("Find Products"),
        centerTitle: true,
      ),
      /* bottomNavigationBar: BottomNavigationBar(
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
      ),*/
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            //shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 250),
            itemCount: items.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => (BeveragesPage())));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 200,
                        color: Colors.grey[200],
                        child: Image.asset(
                          items[i]["image"],
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(items[i]["title"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
