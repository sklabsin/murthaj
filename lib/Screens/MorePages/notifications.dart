import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
          'Notifications',
          style: Theme.of(context)
              .textTheme
              .headline4
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
              OrderItem(
                isDelivered: false,
                screenWidth: screenWidth,
                notification: 'Your orders has been picked up',
                time: 'Now',
              ),
              OrderItem(
                isDelivered: true,
                screenWidth: screenWidth,
                notification: 'Your order has been delivered',
                time: '1 hr ago',
              ),
              OrderItem(
                isDelivered: false,
                screenWidth: screenWidth,
                notification: 'Your orders has been picked up',
                time: '2 d ago',
              ),
              OrderItem(
                isDelivered: true,
                screenWidth: screenWidth,
                notification: 'Your order has been delivered',
                time: '3 d ago',
              ),
              OrderItem(
                isDelivered: false,
                screenWidth: screenWidth,
                notification: 'Your orders has been picked up',
                time: '1 w ago',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  OrderItem(
      {Key key,
      this.screenWidth,
      this.notification,
      this.time,
      this.isDelivered});

  double screenWidth;
  String notification;
  String time;
  bool isDelivered;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: 64,
          color: isDelivered ? Color(0xfff6f6f6) : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.circle,
                        color: Color(0xff2682ab),
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            notification,
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontSize: 15,
                                    ),
                          ),
                        ),
                        Text(
                          time,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 12, color: Color(0xffB6B7B7)),
                        ),
                      ],
                    ),
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
              color: Color(0xffeeeeee),
            ),
          ),
        ),
      ],
    );
  }
}
