import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/AuthenticationModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/loginPage.dart';
import 'package:murthaji/Screens/tabScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);
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
                text: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                ontap: () async {
                  if (fname.text.isNotEmpty &&
                      lname.text.isNotEmpty &&
                      email.text.isNotEmpty &&
                      pass.text.isNotEmpty &&
                      cpass.text.isNotEmpty) {
                    if (pass.text == cpass.text) {
                      AuthenticationClass? data =
                          await Authentication().registrationApi(
                        fname: fname.text,
                        lname: lname.text,
                        email: email.text,
                        pass: pass.text,
                        cpass: cpass.text,
                      );
                      if (data.data?.status == '200') {
                        toastFn(comment: data.data?.message);
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString(
                            'email', "${data.data?.response?.usermail}");
                        pref.setString('id', "${data.data?.response?.userid}");

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Tabscreen()),
                            (route) => false);
                      } else {
                        toastFn(comment: data.data?.message);
                      }
                    } else {
                      toastFn(comment: "Passwords are not same");
                    }
                  } else {
                    toastFn(comment: "Fill all feilds to continue");
                  }
                }),
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
