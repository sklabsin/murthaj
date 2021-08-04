import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/OrderSection/orderHistoryModel.dart';
import 'package:murthaji/Screens/order_details.dart';
import 'package:murthaji/controller/tabController.dart';
import '../constants.dart';
import '../tabScreen.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  TextEditingController code = TextEditingController();
  TabPageController controller = Get.put(TabPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            controller.currenttab.value = 4;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Tabscreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff4a4b4d)),
        ),
        title: Text(
          'My Order',
          style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
        ),
      ),
      body: FutureBuilder<OrderHistoryClass>(
        future: orderHistoryApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return (snapshot.data.data.response.length > 0)
                ? Container(
                    padding: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      itemCount: snapshot.data.data.response.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderDetails(
                                  items: snapshot
                                      .data.data.response[index].orderItem,
                                  totalAmt: snapshot.data.data.response[index]
                                      .ordersTotalAmount,
                                  deliveryCost: snapshot
                                      .data.data.response[index].deliveryCharge,
                                  OrderId: snapshot
                                      .data.data.response[index].ordersUniqId,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff4e99ba),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    height: 80,
                                    width: 60,
                                    child: Image.asset(
                                        'assets/images/order_image.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Order Number : ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                snapshot
                                                        .data
                                                        .data
                                                        .response[index]
                                                        .ordersUniqId ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 160,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Total',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'KD ' +
                                                        snapshot
                                                            .data
                                                            .data
                                                            .response[index]
                                                            .ordersTotalAmount ??
                                                    "",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 160,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Date',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                snapshot
                                                        .data
                                                        .data
                                                        .response[index]
                                                        .ordersDate
                                                        .day
                                                        .toString() +
                                                    " - " +
                                                    snapshot
                                                        .data
                                                        .data
                                                        .response[index]
                                                        .ordersDate
                                                        .month
                                                        .toString() +
                                                    " - " +
                                                    snapshot
                                                        .data
                                                        .data
                                                        .response[index]
                                                        .ordersDate
                                                        .year
                                                        .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 160,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Status',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                snapshot
                                                            .data
                                                            .data
                                                            .response[index]
                                                            .ordersStatus ==
                                                        '0'
                                                    ? "pending"
                                                    : "delivered",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(
                    child: Center(
                      child: Text('Empty'),
                    ),
                  );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: colorblue,
            ));
          }
        },
      ),
    );
  }
}
