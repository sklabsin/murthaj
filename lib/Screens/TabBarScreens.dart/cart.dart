import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:murthaji/Screens/checkout.dart';

import '../constants.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff4a4b4d),
          ),
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.18,
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                style: TextStyle(
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
                              style: TextStyle(
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
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.18,
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                style: TextStyle(
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
                              style: TextStyle(
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
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textBoxWidget(
                        hint: 'Apply Discount Code',
                        context: context,
                        controller: code),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Delivery Methods',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Fixed', style: TextStyle(fontSize: 14)),
                            Spacer(),
                            Text('KD 20.00', style: TextStyle(fontSize: 15)),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              // Icons.circle_outlined,
                              Icons.circle,
                              color: Color(0xff2682AB),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: screenWidth,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Table Rate', style: TextStyle(fontSize: 14)),
                            Spacer(),
                            Text('KD 15.00', style: TextStyle(fontSize: 15)),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              // Icons.circle_outlined,
                              Icons.circle,
                              color: Color(0xff2682AB),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text('Total',
                            style: TextStyle(
                                color: Color(0xff4a4b4d),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text(
                          'KD 304',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xff1c477a)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Checkout()));
                      },
                      child: Container(
                        width: screenWidth,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff2682ab),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text('Checkout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
