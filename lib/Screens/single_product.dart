import 'package:flutter/material.dart';
import 'package:murthaji/Screens/tabScreen.dart';
import 'dart:ui' as ui show ImageFilter;

class SingleProduct extends StatefulWidget {
  const SingleProduct({Key? key}) : super(key: key);

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  bool isFavourite = true;

  int _count = 1;

  void _increment() {
    setState(() {
      if (_count < 10) {
        _count++;
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 1) {
        _count--;
      }
    });
  }

  var product_list = [
    {
      'image': 'assets/images/Image_13.png',
      'title': 'Indoor Modern Deco',
      'price': 'KD 24.99'
    },
    {
      'image': 'assets/images/Image_8.png',
      'title': 'Modern Decor',
      'price': 'KD 24.99'
    },
    {
      'image': 'assets/images/Image_13.png',
      'title': 'Indoor Modern Deco',
      'price': 'KD 24.99'
    },
    {
      'image': 'assets/images/Image_8.png',
      'title': 'Modern Decor',
      'price': 'KD 24.99'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                  'assets/images/chad-montano-MqT0asuoIcU-unsplash.png')),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              actions: [Image.asset('assets/images/shopping-cart.png')],
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18.0,
                  color: Color(0xff1c477a),
                ),
              ),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'CP Plus CCTV Camera',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        child: Image.asset(
                                            'assets/images/fav_border.png'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text('Description',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              color: Color(0xff4a4b4d),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet volutpat consequat mauris nunc. Adipiscing bibendum est ultricies integer. Placerat duis ultricies lacus sed turpis tincidunt id aliquet risus. Velit laoreet id donec ultrices tincidunt arcu non sodales neque. Vitae semper quis lectus nulla at volutpat diam. Vitae nunc sed velit dignissim sodales ut eu sem. Hendrerit gravida rutrum quisque non tellus. Neque gravida in fermentum et sollicitudin ac orci phasellus egestas. Integer enim neque volutpat ac tincidunt vitae semper quis lectus. Augue neque gravida in fermentum et sollicitudin ac orci phasellus. Luctus accumsan tortor posuere ac ut consequat semper viverra. Lorem ipsum dolor sit amet. Habitant morbi tristique senectus et netus. Faucibus turpis in eu mi bibendum. Id cursus metus aliquam eleifend. Ipsum consequat nisl vel pretium lectus. Justo laoreet sit amet cursus sit amet. Massa tempor nec feugiat nisl pretium fusce id.',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Color(0xff7c7d7e),
                                          fontSize: 14,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('KD 750',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                color: Color(0xff4a4b4d),
                                                fontSize: 31,
                                                fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: _decrement,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            color: Color(0xff1c477a),
                                            width: 55,
                                            height: 30,
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Color(0xff2682ab))),
                                            width: 55,
                                            height: 30,
                                            child: Center(
                                              child: Text(
                                                '$_count',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                            )),
                                      ),
                                      GestureDetector(
                                        onTap: _increment,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            color: Color(0xff1c477a),
                                            width: 55,
                                            height: 30,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Material(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Tabscreen(
                                                  count: 1,
                                                ),
                                              ),
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Container(
                                                color: Color(0xff1c477a),
                                                width: 160,
                                                height: 30,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(
                                                          width: 16,
                                                          height: 14,
                                                          child: Image.asset(
                                                              'assets/images/add_cart.png'),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        'Add to Cart',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                            ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Most Popular',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Spacer(),
                                      Text('View all',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                color: Color(0xfffc6011),
                                                fontSize: 14,
                                              )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 320,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: product_list.length,
                                  itemBuilder: (context, index) {
                                    if (product_list.isNotEmpty) {
                                      for (var product in product_list) {
                                        String? image = product['image'];
                                        String? title = product['title'];
                                        String? price = product['price'];

                                        return ProductCard(
                                          screenWidth: screenWidth,
                                          image: image,
                                          price: price,
                                          title: title,
                                        );
                                      }
                                    }
                                    return Container();
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard(
      {Key? key,
      required this.screenWidth,
      required this.image,
      required this.price,
      required this.title})
      : super(key: key);

  final double screenWidth;
  final String? image;
  final String? title;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth / 2.35,
            height: 230,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 8,
                  blurRadius: 10,

                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 170,
                      child: Image.asset(image.toString()),
                    ),
                  ),
                  Text(
                    title.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 16),
                  ),
                  Text(
                    price.toString(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Color(0xff4a4b4d),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
