import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signup_flutter_app/ecommerce/Home.dart';
import 'package:signup_flutter_app/ecommerce/aboutUs.dart';
import 'package:signup_flutter_app/ecommerce/productList.dart';
import 'package:signup_flutter_app/login.dart';

import '../main.dart';
import '../profile.dart';

class Maindrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green,),
              child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.account_box,
                  size: 50,
                ),
              ),
              Container( alignment: Alignment.bottomLeft,
                  child: Text('user name')),
              Container( alignment: Alignment.bottomLeft,
                  child: Text('Username@gmail.com')),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListTile(
                title: Text('Home', style: TextStyle(color: Colors.cyan)),
                leading: Icon(Icons.home, /*color: Colors.lightGreenAccent,*/),

                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
                  Fluttertoast.showToast(
                      msg: 'Home', toastLength: Toast.LENGTH_LONG);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListTile(
                title: Text('Profile', style: TextStyle(color: Colors.cyan)),
                leading: Icon(Icons.people_outline, /*color: Colors.lightGreenAccent,*/),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
                  Fluttertoast.showToast(
                      msg: 'Your Profile', toastLength: Toast.LENGTH_LONG);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListTile(
                title: Text('Order List', style: TextStyle(color: Colors.cyan)),
                leading: Icon(Icons.local_grocery_store_sharp, /*color: Colors.lightGreenAccent,*/),
                onTap: () {
                  Fluttertoast.showToast(
                      msg: 'Empty Order List', toastLength: Toast.LENGTH_LONG);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListTile(
                title: Text('Product_List', style: TextStyle(color: Colors.cyan)),
                leading: Icon(
                  Icons.add_shopping_cart_sharp,
                  /*color: Colors.lightGreenAccent,*/
                ),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList()));
                  Fluttertoast.showToast(
                      msg: 'Product_List', toastLength: Toast.LENGTH_LONG);
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListTile(
                title: Text('About Us', style: TextStyle(color: Colors.cyan)),
                leading: Icon(
                  Icons.description_rounded,
                  /*color: Colors.lightGreenAccent,*/
                ),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
                  Fluttertoast.showToast(
                      msg: 'About Us', toastLength: Toast.LENGTH_LONG);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListTile(
                title: Text('Logout', style: TextStyle(color: Colors.cyan)),
                leading: Icon(Icons.logout_rounded, /*color: Colors.lightGreenAccent,*/),

                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                  Fluttertoast.showToast(
                      msg: 'Logout', toastLength: Toast.LENGTH_LONG);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
