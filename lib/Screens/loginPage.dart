import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/AuthenticationModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/registrationPage.dart';
import 'package:murthaji/Screens/tabScreen.dart';
import 'package:murthaji/controller/spinner.dart';
import 'package:murthaji/controller/tabController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TabPageController controller = Get.put(TabPageController());

  @override
  Widget build(BuildContext context) {
    return Spinner(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            actions: [
              GestureDetector(
                onTap: () async {
                  await checkLogin();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tabscreen(),
                    ),
                    (route) => false,
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: colorblue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
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
                  hint: 'Your Email',
                  context: context,
                  controller: email,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                textBoxWidget(
                  hint: 'Password',
                  context: context,
                  controller: pass,
                  pass: true,
                ),
                SizedBox(
                  height: 30,
                ),
                buttonWidget(
                  text: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  ontap: () async {
                    if (email.text.isNotEmpty && pass.text.isNotEmpty) {
                      showSpinner();
                      AuthenticationClass data =
                          await Authentication().loginApi(
                        email: email.text,
                        pass: pass.text,
                      );
                      hideSpinner();
                      if (data.data?.status == '200') {
                        toastFn(comment: data.data.message);
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString(
                            'email', "${data.data.response.usermail}");
                        pref.setString('uid', "${data.data.response.userid}");
                        pref.setBool('loggedin', true);
                        checkLogin();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Tabscreen()),
                          (route) => false,
                        );
                      } else {
                        toastFn(comment: data.data?.message);
                      }
                    } else {
                      toastFn(comment: 'Fill all fields to continue');
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    if (email.text.isNotEmpty) {
                      showSpinner();
                      String msg = await Authentication().forgotPasswordApi(
                        email: email.text,
                      );
                      hideSpinner();
                      toastFn(comment: msg);
                    } else {
                      toastFn(comment: 'Fill the email');
                    }
                  },
                  child: Text('Forgot your password?'),
                ),
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
        ),
      ),
    );
  }
}
