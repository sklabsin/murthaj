import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/ExtrasModel/AboutModel.dart';
import 'package:murthaji/Screens/constants.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AboutModel>(
      future: Extras().aboutApi(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: colorblue,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(
                EasyLocalization.of(context).currentLocale == Locale('en', 'US')
                    ? snapshot.data.data.response[0].aboutTitle1
                    : snapshot.data.data.response[0].aboutTitleArab,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              height: height(context),
              color: Colors.blue.withOpacity(.2),
              padding: EdgeInsets.only(top: 30, right: 15, left: 15),
              child: Text(
                EasyLocalization.of(context).currentLocale == Locale('en', 'US')
                    ? snapshot.data.data.response[0].aboutContent1
                    : snapshot.data.data.response[0].aboutContentArab,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          );
        } else
          return Scaffold(
            body: Container(
              height: height(context),
              width: width(context),
              child: Center(
                child: CircularProgressIndicator(
                  color: colorblue,
                ),
              ),
            ),
          );
      },
    );
  }
}
