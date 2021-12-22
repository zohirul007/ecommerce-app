import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup_flutter_app/login.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  DateTime? _dateTime;
  int _valueradio = 0;
  int radiovalue = 0;

  String? user_name;

  getDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 2));
    setState(() {
      _dateTime = date;
    });
  }

  TextEditingController userController  = TextEditingController();
  TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Center(child: Text('Sign up')),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userController,
                  //obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'user name',
                      hintText: 'Enter your user name'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password'),
                ),
              ),

              Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFF8A8383))),
                margin: EdgeInsets.only(left: 12, right: 12),
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: _dateTime == null
                            ? Flexible(child: Text('Date : DD-MM-YYYY'))
                            : Text(
                            'Date : ${_dateTime!.day}-${_dateTime!.month}-${_dateTime!.year}')),
                    IconButton(
                        onPressed: () {
                          getDate();
                        },
                        icon: Icon(
                          Icons.date_range_outlined,
                          color: Color(0xFF06D231),
                        ))
                  ],
                ),
              ),

             /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: _valueradio,
                            onChanged: (value) {
                              setState(() {
                                _valueradio = value as int;
                              });
                            }),
                        SizedBox(
                          width: 0,
                        ),
                        Text("Male")
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: _valueradio,
                            onChanged: (value) {
                              setState(() {
                                _valueradio = value as int;
                              });
                            }),
                        SizedBox(
                          width: 0,
                        ),
                        Text("Female")
                      ],
                    ),
                  )
                ],
              ),*/

              TextButton(
                  onPressed: () {
                    getgender();
                  },
                  child: Text('Gender')),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: radiovalue,
                          activeColor: Color(0xFF14C10E),
                          onChanged: (value) {
                            setState(() {
                              radiovalue = value as int;
                            });
                          }),
                      Text('Male')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: radiovalue,
                          onChanged: (value) {
                            setState(() {
                              radiovalue = value as int;
                            });
                          }),
                      Text('Female')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 3,
                          groupValue: radiovalue,
                          onChanged: (value) {
                            setState(() {
                              radiovalue = value as int;
                            });
                          }),
                      Text('Others')
                    ],
                  ),



                ],
              ),

              ElevatedButton(onPressed: (){

                if(userController.text.isEmpty || passController.text.isEmpty || radiovalue == 0){

                  Fluttertoast.showToast(msg: 'Enter user name and pass', toastLength: Toast.LENGTH_LONG);

                }else{
                  Fluttertoast.showToast(msg: 'Submitted successfully', toastLength: Toast.LENGTH_LONG);

                  setSharedPreferance();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));

                }

              }, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  getgender() {
    if (_valueradio == 1) {
      Fluttertoast.showToast(msg: 'Male', toastLength: Toast.LENGTH_LONG);
    } else if (_valueradio == 3){
      Fluttertoast.showToast(msg: 'Female', toastLength: Toast.LENGTH_LONG);
    }
    else {
    Fluttertoast.showToast(msg: 'Others', toastLength: Toast.LENGTH_LONG);
    }
    Fluttertoast.showToast(
        msg: _valueradio.toString(), toastLength: Toast.LENGTH_LONG);
  }

  setSharedPreferance() async {

    final pref = await SharedPreferences.getInstance();

    pref.setString('user_name', userController.text);
    pref.setString('pass', passController.text);

  }



}