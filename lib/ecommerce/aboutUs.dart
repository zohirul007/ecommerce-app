import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("About us")),
      ),
      body:
          Container(
            height:  MediaQuery.of(context).size.height,
            child: Image(
              image: AssetImage('images/cv4android_apps.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),


        );

  }
}
