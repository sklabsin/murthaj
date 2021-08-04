import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murthaji/Screens/MorePages/AboutUs.dart';
import 'package:murthaji/Screens/MorePages/Address.dart';
import 'package:murthaji/Screens/MorePages/CustomerCare.dart';
import 'package:murthaji/Screens/MorePages/Privacy.dart';
import 'package:murthaji/Screens/MorePages/my_order.dart';
import 'package:murthaji/Screens/MorePages/notifications.dart';
import 'package:murthaji/Screens/MorePages/wishlist.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/extras/Bottomsheet.dart';

class MorePage extends StatefulWidget {
  MorePage({Key key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  Language language;

  buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, childState) {
          return AlertDialog(
            title: Text("Select Language"),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('English'),
                      Radio(
                          value: Language.English,
                          groupValue: language,
                          onChanged: (Language value) {
                            // print(value);
                            childState(() {
                              language = value;
                              EasyLocalization.of(context)
                                  .setLocale(Locale('en', 'US'));
                            });
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Arabic'),
                      Radio(
                          value: Language.Arabic,
                          groupValue: language,
                          onChanged: (Language value) {
                            // print(value);
                            childState(
                              () {
                                language = value;
                                EasyLocalization.of(context).setLocale(
                                  Locale('ar', 'AE'),
                                );
                              },
                            );
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EEEE),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // Image.asset('assets/images/cart.png')
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  children: [
                    loggedin
                        ? MoreOption(
                            img: 'assets/images/address.png',
                            txt: 'Address',
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddressList()));
                            },
                          )
                        : MoreOption(
                            img: 'assets/images/address.png',
                            txt: 'Address',
                            ontap: () {
                              bottomsheet(context: context);
                            },
                          ),
                    Divider(),
                    loggedin
                        ? MoreOption(
                            img: 'assets/images/myorder.png',
                            txt: 'All My Orders',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyOrder(),
                                ),
                              );
                            },
                          )
                        : MoreOption(
                            img: 'assets/images/myorder.png',
                            txt: 'All My Orders',
                            ontap: () {
                              bottomsheet(context: context);
                            },
                          ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        return buildShowDialog(context);
                      },
                      child: Container(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/language.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Language',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                EasyLocalization.of(context).currentLocale ==
                                        Locale('en', 'US')
                                    ? Text("English")
                                    : Text("Arabic"),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xff727C8E).withOpacity(.3),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: colorblue,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: .6),
                    loggedin
                        ? MoreOption(
                            img: 'assets/images/wishlist.png',
                            txt: 'Wishlist',
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WishList(),
                                ),
                              );
                            },
                          )
                        : MoreOption(
                            img: 'assets/images/wishlist.png',
                            txt: 'Wishlist',
                            ontap: () {
                              bottomsheet(context: context);
                            },
                          ),
                    Divider(thickness: .6),
                    loggedin
                        ? MoreOption(
                            img: 'assets/images/notification.png',
                            txt: 'Notification',
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Notifications()));
                            },
                          )
                        : MoreOption(
                            img: 'assets/images/notification.png',
                            txt: 'Notification',
                            ontap: () {
                              bottomsheet(context: context);
                            },
                          ),
                    Divider(),
                    MoreOption(
                      img: 'assets/images/privacy.png',
                      txt: 'Privacy',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Privacy(),
                          ),
                        );
                      },
                    ),
                    Divider(),
                    MoreOption(
                      img: 'assets/images/aboutus.png',
                      txt: 'About Us',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutUs(),
                          ),
                        );
                      },
                    ),
                    Divider(),
                    MoreOption(
                      img: 'assets/images/customercare.png',
                      txt: 'CustomerCare',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerCarePage(),
                          ),
                        );
                      },
                    ),
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

class MoreOption extends StatelessWidget {
  MoreOption({Key key, this.img, this.txt, this.ontap});
  String txt;
  String img;
  Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  img,
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  txt ?? '',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Color(0xff727C8E).withOpacity(.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Icon(
                  Icons.navigate_next,
                  color: colorblue,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Language { English, Arabic }
