import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signup_flutter_app/modelClass/productListmodel.dart';

import 'Invoice.dart';

class ProductDetails extends StatefulWidget {
  final productListModel proDetails;

  ProductDetails(this.proDetails);

  @override
  State<ProductDetails> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<ProductDetails> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Product View ',
          ),
          iconTheme: IconThemeData(color: Colors.yellow),
        ),
        body: /*Container(child: Text("Test"),)*/

        Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  child: Container(
                    child: Image.network(widget.proDetails.imageUrl),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                    flex: 15,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            widget.proDetails.title,
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price:\$ ${widget.proDetails.price}',
                                  style:
                                  TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Descount:${widget.proDetails.discount}",
                                  style:
                                  TextStyle(color: Colors.black),
                                ),
                                Card(
                                  color: Colors.lightBlueAccent,
                                  elevation: 5,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height /
                                        8,
                                    width:
                                    MediaQuery.of(context).size.width /
                                        2.5,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Rating",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.white,
                                            ),
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.white,
                                            ),
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.white,
                                            ),
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.white,
                                            ),
                                            Icon(
                                              Icons.star_half_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.proDetails.desc,
                              maxLines: 100,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )),
                Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: Colors.lightBlueAccent,
                            )),
                        height: MediaQuery.of(context).size.height / 10,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (count >= 0) {
                                            count--;
                                          }
                                        });
                                      },
                                      child: Center(
                                          child: Text('-',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)))),
                                  VerticalDivider(
                                    thickness: 1,
                                  ),
                                  Center(child: Text('$count')),
                                  VerticalDivider(
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (count < 10) {
                                            count++;
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                "Sorry you cant more order",
                                                toastLength:
                                                Toast.LENGTH_LONG);
                                          }
                                        });
                                      },
                                      child: Center(
                                          child: Text('+',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)))),
                                ],
                              ),
                            ),

                            //VerticalDivider(thickness: 1,color: Colors.indigo,),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  color: Colors.lightBlueAccent,
                                  child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Invoice(
                                                      widget.proDetails,
                                                      count)));
                                        },
                                        child: Text(
                                          'Add To Cart',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )),
                                ))
                          ],
                        ),
                      ),
                    ))
              ],
            )));
  }
}
