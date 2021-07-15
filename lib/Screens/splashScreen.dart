import 'package:flutter/material.dart';
import 'package:murthaji/Screens/landingPage.dart';
import 'package:murthaji/Screens/tabScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var pref = await SharedPreferences.getInstance();
      (pref.getString('uid') == null)
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
              (route) => false)
          : Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Tabscreen()),
              (route) => false);
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
