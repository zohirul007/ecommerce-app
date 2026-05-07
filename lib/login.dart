import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';
import 'forgotpass.dart';
import 'main.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String user = '';
  String pass = '';

  String superuser = 'admin';
  String superpass = 'admin';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login Page')),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: FlareActor(
              'animation/Teddy.flr',
              alignment: Alignment.center,
              fit: BoxFit.cover,
              animation: 'success',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: userController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter your Name',
                  icon: Icon(
                    Icons.account_box_outlined,
                    size: 50,
                    color: Colors.amberAccent,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                  icon: Icon(
                    Icons.password,
                    size: 50,
                    color: Colors.indigoAccent,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPass()));
                },
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(color: Color(0xFF30F30E)),
                      fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.indigoAccent,
            ),
            //
            child: TextButton(
              onPressed: () {
                /*Fluttertoast.showToast(
                      msg: userController.text+'\n'+passController.text,

                      toastLength:Toast.LENGTH_LONG,
                      gravity:ToastGravity.BOTTOM,
                      backgroundColor: Colors.yellow,
                      textColor: Colors.greenAccent
                  );*/
                if (userController.text.isEmpty ||
                    passController.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: 'Please enter ID and Password',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.yellow,
                      textColor: Colors.greenAccent);
                } else if((userController.text == user &&
                    passController.text == pass) || ((userController.text == superuser &&
                    passController.text == superpass)))  {
                  Fluttertoast.showToast(
                      msg: 'Login successful',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.yellow,
                      textColor: Colors.greenAccent);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHome()));
                } else {
                  Fluttertoast.showToast(
                      msg: 'Please enter valid ID and Password',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.yellow,
                      textColor: Colors.greenAccent);
                }
              },
              child: Text(
                'Sign In',
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(color: Color(0xFFFFFFFF)),
                    fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => signup()));
            },
            child: Text(
              'Have an Account? Sign up',
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(color: Colors.green), fontSize: 15),
            ),
          ))
        ],
      )),
    );
  }

  getSharPref() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      user = pref.getString('user_name') ?? '';
      pass = pref.getString('pass') ?? '';
    });
  }
}
