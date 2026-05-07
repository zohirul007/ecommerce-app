import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup_flutter_app/main.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  DateTime? _dateTime;
  int _valueradio = 0;
  int radiovalue = 0;
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
  String name = '';
  String pass = '';

  File? imageFile;

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
        title: Text("Your Profile"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text('Name : '),
                  Text(name),
                ],
              ),
              Row(
                children: [
                  Text('Password : '),
                  Text(pass),
                ],
              ),
              Container(
                child: CircleAvatar(
                  radius: 100,
                  child: displaySignatureFile(),
                ),
              ),
              TextButton(
                  onPressed: () {


                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: 150,
                              child: Column(
                                children: [

                                  TextButton(onPressed: () { _getFromcamera(); }, child: Text('Camera'),),
                                  TextButton(onPressed: () { _getFromGallery(); }, child: Text('gallery'),),


                                ],
                              ),
                            ),
                          );
                        }

                    );

                    //
                  },
                  child: Text('Choose Image')),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )
                  ),
                child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your name',
                            hintText: 'Enter your full name'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your contact number',
                            hintText: 'Enter your contact number'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                                color: Color(0xFFEEF5EF),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your Address',
                            hintText: 'Enter your full Address'),
                      ),
                    ),
                  ],
                )


              )
            ],
          ),
        ),
      ),
    );
  }

  getShapref() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      name = pref.getString('user_name')!;
      pass = pref.getString('pass')!;
    });
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromcamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Widget displaySignatureFile() {
    return new SizedBox(
      height: 480.0,
      width: 480.0,
      child: imageFile == null
          ? new Icon(Icons.camera_alt_outlined, size: 100)
          : ClipRRect(
          borderRadius: BorderRadius.circular(150.0),
          child: new Image.file(imageFile!,fit: BoxFit.fill,)),
    );
  }
}