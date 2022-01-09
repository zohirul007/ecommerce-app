import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup_flutter_app/modelClass/productListmodel.dart';


class Invoice extends StatefulWidget {
  final productListModel DetailsView;
  int orderNo;

  Invoice(this.DetailsView, this.orderNo);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  String name = '';
  String mobile = '';
  String address = '';
  String pass = '';

  @override
  void initState() {
    // TODO: implement initState
    getShapref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*brightness: Brightness.dark,
        backgroundColor: Colors.transparent,*/
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Your invoice"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Text('Invoice no : 1000',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20))),
                    Divider(thickness: 1, color: Colors.white),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name : $name',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          textAlign: TextAlign.left,
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mobile : $mobile',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          textAlign: TextAlign.left,
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Address : $address',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          textAlign: TextAlign.left,
                        )),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                height: 100,
                color: Colors.white70,
                child: ListTile(
                  leading: Image.network(
                    '${widget.DetailsView.imageUrl}',
                    fit: BoxFit.cover,
                  ),
                  title: Align(
                      alignment: Alignment.centerRight,
                      child: Text('${widget.DetailsView.title}')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.teal)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Price of Product    :       ${widget.DetailsView.price}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Number of order    :       ${widget.orderNo}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Total Discount    :       ${widget.DetailsView.discount}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Unit of Product     :   ${widget.DetailsView.unit}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(thickness: 1, color: Colors.pink),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Net Bill    :       ${(widget.DetailsView.price * widget.orderNo) - widget.DetailsView.discount}',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 20))),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(
                                    child: Text(
                                  "Thanks For Yo Yo",
                                  style: TextStyle(fontSize: 25),
                                )),
                                backgroundColor: Colors.white,
                                elevation: 5,
                              );
                            });

                        //
                      },
                      child: Text('Payment',
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(
                                    child: Text(
                                  "Thanks For Yo Yo",
                                  style: TextStyle(fontSize: 25),
                                )),
                                backgroundColor: Colors.white,
                                elevation: 5,
                              );
                            });
                        //
                      },
                      child: Text('Cash In Delivery',
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  getShapref() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      name = pref.getString('user_name')!;
      mobile = pref.getString('mobile')!;
      address = pref.getString('address')!;
      pass = pref.getString('pass')!;
    });
  }
}
/*
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:signup_flutter_app/modelClass/productListmodel.dart';


class Invoice extends StatelessWidget {

  final productListModel proDetails;
  int orderNo;

  Invoice(this.proDetails, this.orderNo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Center(child: Text('Invoice no : 1000')),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [

                    Text('Name : 1000'),
                    Text('Mobile : 1000'),
                    Text('Address : 1000'),

                  ],
                ),
              ),
            ),

            ListTile(
              leading: Image.network('${proDetails.imageUrl}'),
              title: Column(
                children: [
                  Text('${proDetails.title}'),
                  Text('Number of order : ${orderNo}'),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}*/
