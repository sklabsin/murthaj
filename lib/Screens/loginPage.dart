import 'package:flutter/material.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/registrationPage.dart';
import 'package:murthaji/Screens/tabScreen.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Login'.tr());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, right: 25, left: 25),
        child: Column(
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Add your details to login'),
            SizedBox(
              height: 45,
            ),
            textBoxWidget(
                hint: 'Your Email', context: context, controller: email),
            SizedBox(
              height: 20,
            ),
            textBoxWidget(hint: 'Password', context: context, controller: pass),
            SizedBox(
              height: 30,
            ),
            buttonWidget(
                text: 'Login',
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
                        builder: (context) => RegistrationPage()));
              },
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an Account?',
                    ),
                    TextSpan(
                      text: ' Sign Up',
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
