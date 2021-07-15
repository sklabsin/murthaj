import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff4a4b4d)),
        ),
        title: Text(
          'About Us',
          style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
        ),
      ),
      body: null,
    );
  }
}
