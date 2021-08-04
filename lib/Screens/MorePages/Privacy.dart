import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/ExtrasModel/PrivacyModel.dart';
import 'package:murthaji/Screens/constants.dart';

class Privacy extends StatefulWidget {
  Privacy({Key key}) : super(key: key);

  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            'Privacy',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<PrivacyModel>(
            future: Extras().privacyApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  color: Colors.blue.withOpacity(.2),
                  padding: EdgeInsets.only(right: 15, left: 15, top: 10),
                  child: Text(
                    EasyLocalization.of(context).currentLocale ==
                            Locale('en', 'US')
                        ? snapshot.data.data.response[0].termsContent
                        : snapshot.data.data.response[0].termsContentArab,
                    style: TextStyle(
                      letterSpacing: .4,
                      wordSpacing: 2,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                );
              } else {
                return Container(
                  height: height(context),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: colorblue,
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}
