import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff4a4b4d)),
        ),
        title: Text(
          'Wishlist',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Color(0xff4a4b4d), fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ProductItem(screenWidth: screenWidth),
              ProductItem(screenWidth: screenWidth),
              ProductItem(screenWidth: screenWidth),
              ProductItem(screenWidth: screenWidth),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.18,
        actions: [
          SlideAction(
            child: Row(
              children: [
                Spacer(),
                Container(
                  child: Stack(children: [
                    Center(
                      child: Image.asset(
                        'assets/images/shopping-cart.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Center(
                        child: Image.asset(
                          'assets/images/shopping-cart.png',
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )
        ],
        secondaryActions: <Widget>[
          SlideAction(
            child: Row(
              children: [
                Spacer(),
                Container(
                  child: Image.asset(
                    'assets/images/Icon_Delete.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          )
        ],
        child: Container(
          height: 92,
          width: screenWidth,
          color: Color(0xfff8f8f8),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 80,
                    color: Colors.white,
                    child: Image.asset(
                        'assets/images/chad-montano-MqT0asuoIcU-unsplash.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 165,
                    child: Text(
                      'CP Plus CCTV Camera',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Color(0xff2682AB),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(
                    'KD 100',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Color(0xff2682AB),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
