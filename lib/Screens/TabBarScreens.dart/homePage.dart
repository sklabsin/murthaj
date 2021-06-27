import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/single_product.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  PageController pageController = PageController();

  var list = [
    'Indoor Modern Deco',
    'Modern Decor',
    'Indoor Modern Deco',
    'Modern Decor',
    'Indoor Modern Deco',
    'Modern Decor',
  ];
  final List<String> imgList = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/Img18/Tablets_RK/Lenovo/Shop_Now/D11371803_TabV7_750x375._CB439417305_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuBQ-B5ds1IXksmp7PykXNgATo1KP4IYsj0liU_1mZox84vtXvXCjQC2NkX4IapvxBcGI&usqp=CAU',
    'https://www.asiaone.com/sites/default/files/original_images/Jun2015/Gradient-Migme_a117532_2015june24_NR_tag.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img18/Wearables/Noise_ColorFit2_Fitness_Band/Shop_Now/1999/colorfit2_750x375.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGhvktK0O5wx_bvzHFuKANXObQ4jcJnMyVoNiRqSPveP30Lcz8bufcg53fC_sm8x8bsBI&usqp=CAU',
    'https://newspaperads.ads2publish.com/wp-content/uploads/2019/01/log-on-to-gadgets-now-reflex-bands-fight-is-theirs-choice-is-yours-ad-ahmedabad-times-22-01-2019.png'
  ];

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
                child: Landing(),
              ),
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
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 17),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, int index) {
                    return CardWidget(
                      txt: list[index],
                    );
                  },
                ),
              ),
              Container(
                height: 3,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 2),
                      color: Color(0x33757575),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 135,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 6),
                    pauseAutoPlayOnTouch: true,
                    // enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map(
                        (item) => Container(
                          child: Center(
                            child: Image.network(
                              item,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width - 50,
                              height: 135,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: colorblue)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Just For You',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'New Arrivals',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Offer',
                      style: TextStyle(
                        fontSize: 13,
                      ),
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

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  CardWidget({Key? key, this.txt});
  String? txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 3,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleProduct(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(1, 2),
                  color: Color(0x33757575),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'assets/images/itemimg.png',
                        fit: BoxFit.fill,
                        height: 165,
                        width: (MediaQuery.of(context).size.width - 120) / 2,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 35,
                        child: LikeButton(
                          size: 24,
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
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Color(0xff1C477A),
                              size: 24,
                            );
                          },
                          // likeCount: 665,
                          countBuilder:
                              (int? count, bool isLiked, String text) {
                            var color =
                                isLiked ? Colors.deepPurpleAccent : Colors.grey;
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
                      txt!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'KD 24.99',
                      style: TextStyle(
                          color: Color(0xff4a4b4d),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
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

class TopWidgets extends StatelessWidget {
  TopWidgets({this.name, this.img, Key? key});
  String? img;
  String? name;

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
          child: Image.asset(img!),
        ),
        SizedBox(
          height: 8,
        ),
        Text(name!)
      ],
    );
  }
}

class Landing extends StatefulWidget {
  Landing({Key? key});

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [];
  List<String> slides = [
    'assets/images/sliderimg.png',
    'assets/images/sliderimg.png',
    'assets/images/sliderimg.png'
  ];
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
    for (int i = 0; i < slides.length; i++) {
      print(i);
      (slides[i].isNotEmpty)
          ? _pages.add(
              Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      slides[i],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          : Container(
              height: 190,
              width: 180,
              color: Colors.grey,
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
                        padding: const EdgeInsets.all(7.0),
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
