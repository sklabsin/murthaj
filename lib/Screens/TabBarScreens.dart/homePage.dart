import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/HomePage/BottomSliderModel.dart';
import 'package:murthaji/Model/HomePage/mostPopularModel.dart';
import 'package:murthaji/Model/HomePage/topSliderModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/single_product.dart';
import 'package:murthaji/extras/containerLoader.dart';
import 'package:murthaji/extras/gridViewLoading.dart';
import 'package:murthaji/extras/likeButton.dart';
import 'package:murthaji/extras/screenSizes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40, right: 20, left: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              size: 26,
                              color: Color(0xff1C477A),
                            ),
                            hintText: 'search',
                            hintStyle: TextStyle(
                                fontSize: 16, color: Color(0xffB6B7B7)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 30, bottom: 10, top: 12, right: 15),
                          ),
                        ),
                      ),
                    ),
                    Image.asset('assets/images/cart.png')
                  ],
                ),
              ),
              Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 30),
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
                height: 10,
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TopWidgets(
                      img: 'assets/images/cctv.png',
                      name: 'Cctv',
                    ),
                    TopWidgets(
                      img: 'assets/images/cable.png',
                      name: 'Cable',
                    ),
                    TopWidgets(
                      img: 'assets/images/mechanical.png',
                      name: 'Mechanical',
                    ),
                    TopWidgets(
                      img: 'assets/images/lightining.png',
                      name: 'Lightining',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xffFC6011),
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder<MostPopularClass>(
                  future: Home().mostPopularApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<MostPopularClass> snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data?.data;
                      print(data?.response?.length.toString());
                      return Container(
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
                              data: data.response[index],
                            );
                          },
                        ),
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
                        items: snapshot.data?.data?.response
                            ?.map(
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
                                        "$imgurl" + "${item.middlebannerImage}",
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
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xffFC6011),
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder<MostPopularClass>(
                  future: Home().newArrivalsApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<MostPopularClass> snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data?.data;
                      print(data?.response?.length.toString());
                      return Container(
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
                      );
                    } else {
                      return loadingIndicatorGridView();
                    }
                  }),
            ],
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
  Response data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleProduct(),
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
                      data.productName ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
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
        Align(
          alignment: Alignment.topRight,
          child: LikeSection(
            pid: data.productId,
            wishlistStatus: data.wishliststatus,
          ),
        ),
      ],
    );
  }
}

class TopWidgets extends StatelessWidget {
  TopWidgets({this.name, this.img, Key key});
  String img;
  String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Color(0xff141414).withOpacity(.7),
            ),
          ),
          child: Image.asset(img),
        ),
        SizedBox(
          height: 8,
        ),
        Text(name ?? '')
      ],
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
