import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/registrationPage.dart';

import 'loginPage.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height / 2) + 40,
            child: Image.asset(
              'assets/images/toppart.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 2) - 50,
                  width: 50,
                ),
                Container(
                  height: 160,
                  width: 130,
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Discover the best electronic Items from over \n1,00000 Product ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: buttonWidget(
                      text: 'Login',
                      ontap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => LoginPage()));
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color(0xff2682AB),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => RegistrationPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Container(
                      height: 56,
                      child: Center(
                        child: Text(
                          'Create an Account',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff2682AB),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
