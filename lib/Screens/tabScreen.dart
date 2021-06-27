import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murthaji/Screens/TabBarScreens.dart/categoryPage.dart';
import 'package:murthaji/Screens/TabBarScreens.dart/homePage.dart';
import 'package:murthaji/controller/tabController.dart';
import 'TabBarScreens.dart/cart.dart';
import 'TabBarScreens.dart/morePage.dart';
import 'TabBarScreens.dart/profile.dart';
import 'constants.dart';

class Tabscreen extends StatefulWidget {
  Tabscreen({Key? key, this.count}) : super(key: key);
  int? count;

  @override
  _TabscreenState createState() => _TabscreenState();
}

@override
class _TabscreenState extends State<Tabscreen> {
  List<Widget> screen = [
    CategoryPage(),
    Cart(),
    HomePage(),
    Profile(),
    MorePage(),
  ];
  PageStorageBucket bucket = PageStorageBucket();
  TabPageController controller = Get.put(TabPageController());
  void initState() {
    (widget.count == null)
        ? controller.currenttab.value = 2
        : controller.currenttab.value = widget.count!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Obx(
      () => Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: screen[controller.currenttab.value],
        ),
        floatingActionButton: Container(
          height: keyboardIsOpened ? 0 : 70,
          width: keyboardIsOpened ? 0 : 70,
          child: FloatingActionButton(
            backgroundColor: (controller.currenttab.value == 2)
                ? colorblue
                : Color(0xffB6B7B7),
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/home.png',
                height: 30,
                width: 30,
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              controller.currenttab.value = 2;
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
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.currenttab.value = 0;
                        print(controller.currenttab.value);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/tab1.png',
                            height: 20,
                            width: 20,
                            fit: BoxFit.fill,
                            color: (controller.currenttab.value == 0)
                                ? colorblue
                                : Color(0xffB6B7B7),
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
                    InkWell(
                      onTap: () {
                        controller.currenttab.value = 1;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/tab2.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill,
                              color: (controller.currenttab.value == 1)
                                  ? colorblue
                                  : Color(0xffB6B7B7),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '  Cart  ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
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
                    InkWell(
                      onTap: () {
                        controller.currenttab.value = 3;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/tab3.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill,
                              color: (controller.currenttab.value == 3)
                                  ? colorblue
                                  : Color(0xffB6B7B7),
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
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.currenttab.value = 4;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/tab4.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill,
                              color: (controller.currenttab.value == 4)
                                  ? colorblue
                                  : Color(0xffB6B7B7),
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
