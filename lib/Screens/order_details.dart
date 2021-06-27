import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
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
          'My Order',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Color(0xff4a4b4d), fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            OrderItem(
              screenWidth: screenWidth,
              name: '3 Gang Socket, 2 USB x1',
              price: 'KD 100',
            ),
            OrderItem(
              screenWidth: screenWidth,
              name: '13 A SOCKET 2 GANG',
              price: 'KD 100',
            ),
            OrderItem(
              screenWidth: screenWidth,
              name: '3 Gang Socket, 2 USB x1',
              price: 'KD 100',
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Delivery Cost',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Color(0xff4a4b4d),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('KD 20',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Color(0xff4e99ba),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('Payment',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Color(0xff4a4b4d),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('Cash on delivery',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Color(0xff4a4b4d),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('Total',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Color(0xff4a4b4d),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('KD 520',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Color(0xff4e99ba),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Delivery Address',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color(0xff4a4b4d),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      'Meshref\nthomson center \n2nd floor  center  thrissur\nAbhcon Atrium Building, \ndesing@gmail.com\n0999569683',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 14, color: Color(0xff4a4b4d)))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.screenWidth,
    required this.name,
    required this.price,
  }) : super(key: key);

  final double screenWidth;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: 48,
          color: Color(0xffD8E9F0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: screenWidth / 1.5,
                    child: Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 14, color: Color(0xff4a4b4d)),
                    ),
                  ),
                  Spacer(),
                  Text(
                    price,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 14, color: Color(0xff4a4b4d)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Color(0xffD8E9F0),
          height: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 1,
              color: Color(0xffcddce3),
            ),
          ),
        ),
      ],
    );
  }
}
