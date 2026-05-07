import 'package:flutter/material.dart';

class counter extends StatefulWidget {

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              child: Text('$count',style: TextStyle(fontSize: 32),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextButton(onPressed: (){
                  setState(() {
                    count++;
                  });
                },
                    child: Text('Add',style: TextStyle(fontSize: 20),)),

                TextButton(onPressed: (){
                  setState(() {
                    count--;
                  });
                },
                    child: Text('Sub',style: TextStyle(fontSize: 20),))

              ],
            )

          ],
        ),
      ),
    );
  }
}