import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/HomePage/BottomSliderModel.dart';
import 'package:murthaji/Model/HomePage/homeMainCategoryModel.dart';
import 'package:murthaji/Model/HomePage/mostPopularModel.dart';
import 'package:murthaji/Model/HomePage/topSliderModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/seeAllPage.dart';
import 'package:murthaji/Screens/single_product.dart';
import 'package:murthaji/controller/cartController.dart';
import 'package:murthaji/controller/categoryController.dart';
import 'package:murthaji/controller/spinner.dart';
import 'package:murthaji/controller/tabController.dart';
import 'package:murthaji/extras/Bottomsheet.dart';
import 'package:murthaji/extras/containerLoader.dart';
import 'package:murthaji/extras/gridViewLoading.dart';
import 'package:murthaji/extras/screenSizes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  PageController pageController = PageController();
  TabPageController controller = Get.put(TabPageController());
  CartListController cartListcontroller = Get.put(CartListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Spinner(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: SearchItems(),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(right: 5),
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 15),
                                Text('Search'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      loggedin
                          ? GestureDetector(
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
                ),
                Container(
                    height: 200,
                    margin: EdgeInsets.only(top: 15),
                    width: double.infinity,
                    child: FutureBuilder<TopSliderClass>(
                      future: Home().topSliderApi(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          return Landing(
                            data: snapshot.data.data.response,
                          );
                        } else {
                          return containerLoading(context);
                        }
                      },
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 115,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: FutureBuilder<HomeMainCategoryModel>(
                      future: Home().mainCategoryApi(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.data.response.length,
                              itemBuilder: (context, index) {
                                return TopWidgets(
                                  i: index,
                                  catid: snapshot.data.data.response[index]
                                          .categoryId ??
                                      "",
                                  img: snapshot.data.data.response[index]
                                      .categoryHomepic,
                                  name: EasyLocalization.of(context)
                                              .currentLocale ==
                                          Locale('en', 'US')
                                      ? snapshot.data.data.response[index]
                                          .categoryLabel
                                      : snapshot.data.data.response[index]
                                              .categoryLabelAr ??
                                          "",
                                );
                              });
                        } else {
                          return Container();
                        }
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<MostPopularClass>(
                    future: Home().mostPopularApi(),
                    builder: (BuildContext context,
                        AsyncSnapshot<MostPopularClass> snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data?.data;
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 17),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Most Popular',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SeeAllPage(
                                            data: snapshot.data,
                                            txt: 'Most Popular',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'View all',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xffFC6011),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 17),
                              child: GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                // itemCount: snapshot.data!.data!.response!.length,
                                itemCount: 6,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      ScreenSize.gridRatio(context),
                                ),
                                itemBuilder: (context, int index) {
                                  return CardWidget(
                                    data: data.response[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return loadingIndicatorGridView();
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                FutureBuilder<BottomSliderClass>(
                  future: Home().bottomSliderApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 150,
                        width: width(context),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            autoPlay: true,
                            reverse: false,
                            viewportFraction: .93,
                            autoPlayInterval: Duration(seconds: 6),
                            pauseAutoPlayOnTouch: true,
                            // enlargeCenterPage: true,
                          ),
                          items: snapshot.data.data.response
                              .map(
                                (item) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "$imgurl" +
                                              "${item.middlebannerImage}",
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          height: 140,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    } else {
                      return Container(
                        height: 150,
                        width: width(context),
                        child: containerLoading(context),
                      );
                    }
                  },
                ),
                Divider(),
                SizedBox(
                  height: 25,
                ),
                FutureBuilder<MostPopularClass>(
                  future: Home().newArrivalsApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<MostPopularClass> snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data?.data;
                      // print(data?.response?.length.toString());
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'New Arrivals',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SeeAllPage(
                                          data: snapshot.data,
                                          txt: 'New Arrivals',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'View all',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xffFC6011),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 17),
                            child: GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              // itemCount: snapshot.data!.data!.response!.length,
                              itemCount: 6,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                crossAxisCount: 2,
                                childAspectRatio: ScreenSize.gridRatio(context),
                              ),
                              itemBuilder: (context, int index) {
                                return CardWidget(
                                  data: data?.response[index],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return loadingIndicatorGridView();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  CardWidget({Key key, this.txt, this.data});
  String txt;
  CardResponse data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleProduct(pro_id: data.productId),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  color: Color(0x33757575).withOpacity(.2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "$imgurl" + "${data.productImage.split(',')[0]}",
                      fit: BoxFit.fill,
                      width: (width(context) - 90) / 2,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      EasyLocalization.of(context).currentLocale ==
                              Locale('en', 'US')
                          ? data.productName ?? ''
                          : data.productNameArab ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "KD " + data.productSellPrice ?? '',
                      style: TextStyle(
                        color: Color(0xff4a4b4d),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // loggedin
        //     ? Align(
        //         alignment: Alignment.topRight,
        //         child: LikeSection(
        //           pid: data.productId,
        //           wishlistStatus: data.wishliststatus,
        //         ),
        //       )
        //     : Align(
        //         alignment: Alignment.topRight,
        //         child: InkWell(
        //           onTap: () {
        //             bottomsheet(context: context);
        //           },
        //           child: Container(
        //             height: 35,
        //             width: 40,
        //             padding: EdgeInsets.only(right: 10, top: 10),
        //             child: Icon(Icons.favorite_border),
        //           ),
        //         ),
        //       ),
      ],
    );
  }
}

class TopWidgets extends StatelessWidget {
  TopWidgets({this.name, this.img, Key key, this.catid, this.i});
  String img;
  String name;
  String catid;
  int i;

  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.put(CategoryController());
    TabPageController tabcontroller = Get.put(TabPageController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: (width(context) * .1 - 18) / 2),
      width: 75,
      height: 75,
      child: GestureDetector(
        onTap: () async {
          controller.selectedindex.value = i;
          controller.selectedCategory.value = catid;
          controller.selectedSubCategoryIndex.value = 0;
          // print(controller.selectedCategory.value);
          showSpinner();
          await controller.fetchSubCategory();
          await controller.fetchproducts();
          hideSpinner();
          tabcontroller.currenttab.value = 0;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Color(0xff141414).withOpacity(.7),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "${imgurl}" + "${img}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                name ?? '',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Landing extends StatefulWidget {
  Landing({Key key, this.data});
  List<SliderResponse> data;
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    addtoList();
  }

  addtoList() {
    for (int i = 0; i < widget.data.length; i++) {
      _pages.add(
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage(slides[i]),
              image: NetworkImage(
                "${imgurl}" + "${widget.data[i].bannerImage}",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data[i].bannerTitle ?? "",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.limeAccent[900],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      widget.data[i].bannerShortdesc ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.limeAccent[900],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: _pages.length,
              allowImplicitScrolling: true,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    _pages.length,
                    (int index) {
                      return Padding(
                        padding: EdgeInsets.all(7.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: 10,
                          width: 10,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: (index == _currentPage)
                                ? colorblue
                                : Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchItems extends SearchDelegate<String> {
  SearchItems();
  List items = [
    'Light',
    'Tube',
    "fan",
    "switch",
    "switch-2",
    "Fan-2",
    "Fan-3",
  ];
  List recentlist = ["fan-2", "switch", "tube"];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder<MostPopularClass>(
        future: Home().searchProductApi(keyword: query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: colorblue.withOpacity(.2),
              width: double.infinity,
              height: height(context),
              padding: EdgeInsets.only(left: 17, right: 17, top: 20),
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.data.response.length,
                // itemCount: 6,
                physics: AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: ScreenSize.gridRatio(context),
                ),
                itemBuilder: (context, int index) {
                  return CardWidget(
                    data: snapshot.data.data.response[index],
                  );
                },
              ),
            );
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final list = query.isEmpty
        ? recentlist
        : items
            .where(
              (p) => p.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () async {
            showResults(context);
          },
          title: RichText(
            text: TextSpan(
              text: list[index].substring(0, query.length),
              style: TextStyle(
                color: colorblue,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: list[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
