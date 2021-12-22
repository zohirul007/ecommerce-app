import 'package:flutter/material.dart';


class ChoiceRow extends StatefulWidget {
  @override
  _ChoiceRowState createState() => _ChoiceRowState();
}

class _ChoiceRowState extends State<ChoiceRow> {

  List<bool> isPressedList = [false,false,false];

  String classChoice = '';

  @override
  Widget build(BuildContext context) {

    print("Status L $isPressedList");

    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple choice'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30),
            GestureDetector(
              onTap: (){
                print("Hello");
                setState(() {
                  isPressedList[0] = true;
                  isPressedList[1] = false;
                  isPressedList[2] = false;
                });
              },
              child: ChoiceButton(
                isPressed: isPressedList[0],
                label: 'A',
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: (){
                setState(() {
                  isPressedList[0] = false;
                  isPressedList[1] = true;
                  isPressedList[2] = false;
                });
              },
              child: ChoiceButton(
                isPressed: isPressedList[1],
                label: 'B',
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: (){
                setState(() {
                  isPressedList[0] = false;
                  isPressedList[1] = false;
                  isPressedList[2] = true;
                });
              },
              child: ChoiceButton(
                isPressed: isPressedList[2],
                label: 'C',
              ),
            ),
          ],
        ),
      ),
    );


  }
}

class ChoiceButton extends StatelessWidget {

  final String? label;
  final bool? isPressed;

  ChoiceButton({this.label,this.isPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,

      decoration: BoxDecoration(
        color: isPressed! ? Colors.blue : Colors.transparent,
        border: Border.all(
          color: Colors.blue,
          width: 80 * 0.05,
        ),
      ),
      child: Center(
        child: Text(
          label!,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isPressed! ? Colors.white : Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}