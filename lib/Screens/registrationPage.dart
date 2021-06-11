import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/loginPage.dart';
import 'package:murthaji/Screens/tabScreen.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, right: 25, left: 25),
        child: Column(
          children: [
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Add your details to sign up'),
            SizedBox(
              height: 45,
            ),
            textBoxWidget(
                hint: 'First Name', context: context, controller: fname),
            SizedBox(
              height: 20,
            ),
            textBoxWidget(
                hint: 'Last Name', context: context, controller: lname),
            SizedBox(
              height: 20,
            ),
            textBoxWidget(hint: 'Email', context: context, controller: email),
            SizedBox(
              height: 20,
            ),
            textBoxWidget(hint: 'Password', context: context, controller: pass),
            SizedBox(
              height: 20,
            ),
            textBoxWidget(
                hint: 'Confirm Password', context: context, controller: cpass),
            SizedBox(
              height: 30,
            ),
            buttonWidget(
                text: 'Sign Up',
                ontap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Tabscreen()),
                      (route) => false);
                }),
            SizedBox(
              height: 30,
            ),
            Text('Forgot your password?'),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an Account?',
                    ),
                    TextSpan(
                      text: ' Login',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2682AB),
                      ),
                    ),
                  ],
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
