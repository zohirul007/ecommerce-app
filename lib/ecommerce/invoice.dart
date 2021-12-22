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
}