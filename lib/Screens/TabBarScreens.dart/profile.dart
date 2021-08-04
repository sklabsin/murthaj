import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/profileModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/controller/cartController.dart';
import 'package:murthaji/controller/favouriteController.dart';
import 'package:murthaji/controller/spinner.dart';
import 'package:murthaji/controller/tabController.dart';
import 'package:murthaji/extras/Bottomsheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../landingPage.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  bool active = false;
  TabPageController controller = Get.put(TabPageController());
  CartListController cartListcontroller = Get.put(CartListController());
  FavoritesListController favListcontroller =
      Get.put(FavoritesListController());

  @override
  Widget build(BuildContext context) {
    return Spinner(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<ProfileClass>(
          future: profileAPi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              fname.text = snapshot.data.data.response.firstName;
              lname.text = snapshot.data.data.response.lastName;
              email.text = snapshot.data.data.response.email;
              pass.text = snapshot.data.data.response.password;
              cpass.text = snapshot.data.data.response.confirmPassword;
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          loggedin
                              ? InkWell(
                                  onTap: () {
                                    controller.currenttab.value = 1;
                                  },
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                          height: 40,
                                          child: Image.asset(
                                              'assets/images/cart.png')),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Obx(
                                          () => Badge(
                                            position: BadgePosition.topEnd(
                                                top: 0, end: 3),
                                            badgeContent: Text(
                                              cartListcontroller.itemcount.value
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    bottomsheet(context: context);
                                  },
                                  child: Image.asset('assets/images/cart.png'),
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        radius: 51,
                        backgroundColor: Colors.amber,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 15,
                            color: colorblue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                active = true;
                              });
                            },
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(fontSize: 12, color: colorblue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        snapshot.data.data.response.firstName +
                                " " +
                                snapshot.data.data.response.lastName ??
                            "",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorblue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => InkWell(
                            onTap: () async {
                              showSpinner();
                              controller.currenttab.value = 2;
                              var pref = await SharedPreferences.getInstance();
                              pref.clear();
                              cartListcontroller.cartItems.clear();
                              favListcontroller.favlist.clear();
                              await checkLogin();
                              hideSpinner();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LandingPage(),
                                  ),
                                  (route) => false);
                            },
                            child: RichText(
                              text: TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Sign Out',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: colorblue,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        controller.currenttab.value.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      (!active)
                          ? Container()
                          : Column(children: [
                              SingleTextbox(
                                label: 'FirstName',
                                obs: false,
                                controller: fname,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SingleTextbox(
                                label: 'LastName',
                                obs: false,
                                controller: lname,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SingleTextbox(
                                label: 'Email',
                                obs: false,
                                controller: email,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SingleTextbox(
                                label: 'Password',
                                obs: true,
                                controller: pass,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SingleTextbox(
                                label: 'Confirm Password',
                                obs: true,
                                controller: cpass,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              buttonWidget(
                                ontap: () async {
                                  if (fname.text.isNotEmpty &&
                                      lname.text.isNotEmpty &&
                                      email.text.isNotEmpty &&
                                      pass.text.isNotEmpty &&
                                      cpass.text.isNotEmpty) {
                                    if (pass.text == cpass.text) {
                                      showSpinner();
                                      String msg = await updateProfile(
                                          fname: fname.text,
                                          lname: lname.text,
                                          email: email.text,
                                          pass: pass.text,
                                          cpass: cpass.text);
                                      hideSpinner();
                                      toastFn(comment: msg);
                                      setState(() {
                                        active = false;
                                      });
                                    } else {
                                      toastFn(
                                          comment: 'Passwords are not same');
                                    }
                                  } else {
                                    toastFn(comment: 'Fill all feilds');
                                  }
                                },
                                text: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ]),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class SingleTextbox extends StatelessWidget {
  SingleTextbox({this.controller, this.label, this.obs});
  bool obs;
  String label;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: controller,
        obscureText: obs,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, color: Color(0xffB6B7B7)),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 30, bottom: 11, right: 15, top: 10),
        ),
      ),
    );
  }
}
