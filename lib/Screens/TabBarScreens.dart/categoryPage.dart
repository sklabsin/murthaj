import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:like_button/like_button.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:get/get.dart';
import 'package:murthaji/controller/categoryController.dart';
import 'package:murthaji/extras/screenSizes.dart';
import '../single_product.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: <Widget>[
            LeftWidget(),
            Expanded(
              child: RightWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class LeftWidget extends StatefulWidget {
  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> {
  List<String> list = [
    "My profile",
    "Notifcation",
    "Invoice",
    "Home",
    "My profile",
    "Notifcation",
    "Invoice",
    "Home"
  ];

  CategoryController controller = Get.put(CategoryController());

  int checkIndex = 0;

  @override
  void initState() {
    checkIndex = list.length - 1;

    super.initState();
    SchedulerBinding.instance!.endOfFrame.then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Container(
              width: 55,
              height: MediaQuery.of(context).size.height - 190,
              padding: EdgeInsets.only(top: 30, bottom: 30),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: colorblue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(90),
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Obx(
                  () => Column(children: [
                    for (int i = 0; i < list.length; i++)
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.selectedindex.value = i;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: (controller.selectedindex.value == i)
                                    ? Colors.white.withOpacity(.8)
                                    : Colors.transparent,
                              ),
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Text(
                                  list[i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (controller.selectedindex.value == i)
                                        ? colorblue
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RightWidget extends StatefulWidget {
  @override
  _RightWidgetState createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      child: DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "Category",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: SizedBox(
                height: 30,
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.black,
                  labelColor: Color(0xff365EFF),
                  labelStyle: TextStyle(fontSize: 12),
                  indicator: BoxDecoration(
                    color: Color(0xffEDF0FF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  tabs: <Widget>[
                    Tab(
                      text: "SubCategory",
                    ),
                    Tab(
                      text: "SubCategory",
                    ),
                    Tab(
                      text: "SubCategory",
                    ),
                    Tab(
                      text: "SubCategory",
                    ),
                    Tab(
                      text: "SubCategory",
                    ),
                    Tab(
                      text: "SubCategory",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  RightBody(),
                  RightBody(),
                  RightBody(),
                  RightBody(),
                  RightBody(),
                  RightBody(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RightBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4, top: 10, bottom: 25),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: ScreenSize.gridRatio(context) * 2.3,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleProduct(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffC1BCBC)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 2),
                          color: Colors.grey.withOpacity(.1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 13, 5, 0),
                              child: Image.asset(
                                'assets/images/itemimg.png',
                                fit: BoxFit.fill,
                                height:
                                    (MediaQuery.of(context).size.height - 450) /
                                        3,
                                width:
                                    (MediaQuery.of(context).size.width - 220) /
                                        2,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 8, 4, 0),
                                width: 30,
                                child: LikeButton(
                                  size: 20,
                                  circleColor: CircleColor(
                                    start: Color(0xff1C477A),
                                    end: Color(0xff1C477A),
                                  ),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Colors.red,
                                    dotSecondaryColor: Colors.red,
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked
                                          ? Colors.red
                                          : Color(0xff1C477A),
                                      size: 20,
                                    );
                                  },
                                  // likeCount: 665,
                                  countBuilder:
                                      (int? count, bool isLiked, String text) {
                                    var color = isLiked
                                        ? Colors.deepPurpleAccent
                                        : Colors.grey;
                                    Widget result;
                                    if (count == 0) {
                                      result = Text(
                                        "love",
                                        style: TextStyle(color: color),
                                      );
                                    } else
                                      result = Text(
                                        text,
                                        style: TextStyle(color: color),
                                      );
                                    return result;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$30.00',
                              style: TextStyle(
                                  color: Color(0xff365EFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Lamp new',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
