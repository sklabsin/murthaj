import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/ExtrasModel/ContactUsModel.dart';

import '../constants.dart';

class CustomerCarePage extends StatefulWidget {
  CustomerCarePage({Key key}) : super(key: key);

  @override
  _CustomerCarePageState createState() => _CustomerCarePageState();
}

class _CustomerCarePageState extends State<CustomerCarePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ContactUsModel>(
      future: Extras().contactApi(),
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
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.network(
                        "$imgurl" +
                            "${snapshot.data.data.response[0].contactBanner.split(',')[0]}",
                        fit: BoxFit.fill,
                        height: 100,
                        width: width(context),
                      ),
                    ),
                    SingleCardWidget(
                      icon: Icon(
                        Icons.location_pin,
                        color: colorblue,
                      ),
                      heading: 'Address',
                      text: EasyLocalization.of(context).currentLocale ==
                              Locale('en', 'US')
                          ? snapshot.data.data.response[0].contactAddress ?? ""
                          : snapshot.data.data.response[0].contactAddressAr ??
                              "",
                      color: Colors.blue.withOpacity(.2),
                    ),
                    SingleCardWidget(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.orange,
                      ),
                      heading: 'Mobile',
                      text: snapshot.data.data.response[0].contactPhon ?? "",
                      color: Colors.orange.withOpacity(.2),
                    ),
                    SingleCardWidget(
                      icon: Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.red,
                      ),
                      heading: 'Email',
                      text: snapshot.data.data.response[0].contactCmail ?? "",
                      color: Colors.red.withOpacity(.2),
                    ),
                    SingleCardWidget(
                      icon: Image.asset(
                        'assets/images/wicon.png',
                        height: 35,
                        width: 35,
                      ),
                      heading: 'Whatsapp',
                      text:
                          snapshot.data.data.response[0].contactWhatsapp ?? "",
                      color: Colors.green.withOpacity(.7),
                    ),
                  ],
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

class SingleCardWidget extends StatelessWidget {
  SingleCardWidget({Key key, this.color, this.text, this.icon, this.heading});
  Color color;
  String text;
  Widget icon;
  String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: 80,
          width: width(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 25, backgroundColor: Colors.white, child: icon),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      heading,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(text),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
