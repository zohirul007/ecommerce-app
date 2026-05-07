import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:signup_flutter_app/profile.dart';
import 'package:signup_flutter_app/splash.dart';
import 'ecommerce/Home.dart';
import 'ecommerce/productList.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  PageController _pageController = PageController();
  List<Widget> pages = [Home(), ProductList(), profile()];

  int _selectedIndex = 0;

  @override

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {

    return Scaffold(

        body: PageView(
      controller: _pageController,
      children: pages,
      onPageChanged: onPagedChanged,
    ),

    bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            color: Colors.blue,
            buttonBackgroundColor: Colors.greenAccent,
            backgroundColor: Colors.transparent,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 400),
            items: <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.card_travel_rounded, size: 30),
              Icon(Icons.person, size: 30),
            ],
            onTap: (index) {
              setState(() {
                _pageController.jumpToPage(index);
                _selectedIndex = index;
              });
            },
          ),

        );
  }

  void onPagedChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}