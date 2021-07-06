import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/controller/spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../landingPage.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Spinner(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Image.asset('assets/images/cart.png')
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 51,
                  backgroundColor: Colors.amber,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 15,
                      color: colorblue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 12, color: colorblue),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Hi there E4 Techno',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorblue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    var pref = await SharedPreferences.getInstance();
                    pref.clear();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LandingPage()),
                        (route) => false);
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 11,
                      color: colorblue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SingleTextbox(
                  label: 'FirstName',
                  obs: false,
                  controller: fname,
                ),
                SizedBox(
                  height: 15,
                ),
                SingleTextbox(
                  label: 'LastName',
                  obs: false,
                  controller: fname,
                ),
                SizedBox(
                  height: 15,
                ),
                SingleTextbox(
                  label: 'Email',
                  obs: false,
                  controller: fname,
                ),
                SizedBox(
                  height: 15,
                ),
                SingleTextbox(
                  label: 'Password',
                  obs: true,
                  controller: fname,
                ),
                SizedBox(
                  height: 15,
                ),
                SingleTextbox(
                  label: 'Confirm Password',
                  obs: true,
                  controller: fname,
                ),
                SizedBox(
                  height: 30,
                ),
                buttonWidget(
                  ontap: () {},
                  text: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingleTextbox extends StatelessWidget {
  SingleTextbox({this.controller, this.label, this.obs});
  bool? obs;
  String? label;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: controller,
        obscureText: obs!,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, color: Color(0xffB6B7B7)),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 30, bottom: 11, right: 15, top: 10),
        ),
      ),
    );
  }
}
