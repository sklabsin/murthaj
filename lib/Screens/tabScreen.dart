import 'package:flutter/material.dart';
import 'package:murthaji/Screens/TabBarScreens.dart/cartPage.dart';
import 'package:murthaji/Screens/TabBarScreens.dart/categoryPage.dart';
import 'package:murthaji/Screens/TabBarScreens.dart/homePage.dart';
import 'TabBarScreens.dart/morePage.dart';
import 'TabBarScreens.dart/profile.dart';
import 'constants.dart';

class Tabscreen extends StatefulWidget {
  Tabscreen({Key key}) : super(key: key);

  @override
  _TabscreenState createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  int currenttab = 0;
  List<Widget> screen = [
    CategoryPages(),
    CartPage(),
    HomePage(),
    Profile(),
    MorePage(),
  ];
  PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: screen[currenttab]),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Color(0xffB6B7B7),
          elevation: 10,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Image.asset('assets/images/home.png',
                height: 30,
                width: 30,
                fit: BoxFit.fill,
                color: (currenttab == 0) ? colorblue : Colors.white),
          ),
          onPressed: () {
            setState(() {
              currenttab = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 50,
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currenttab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/tab1.png',
                          height: 20,
                          width: 20,
                          fit: BoxFit.fill,
                          color:
                              (currenttab == 0) ? colorblue : Color(0xffB6B7B7),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Category',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currenttab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/tab2.png',
                          height: 20,
                          width: 20,
                          fit: BoxFit.fill,
                          color:
                              (currenttab == 1) ? colorblue : Color(0xffB6B7B7),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          ' Cart ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currenttab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/tab3.png',
                          height: 20,
                          width: 20,
                          fit: BoxFit.fill,
                          color:
                              (currenttab == 3) ? colorblue : Color(0xffB6B7B7),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currenttab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/tab4.png',
                          height: 20,
                          width: 20,
                          fit: BoxFit.fill,
                          color:
                              (currenttab == 4) ? colorblue : Color(0xffB6B7B7),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'More',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
