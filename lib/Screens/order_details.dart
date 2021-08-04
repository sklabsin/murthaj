import 'package:flutter/material.dart';
import 'package:murthaji/Model/OrderSection/orderHistoryModel.dart';
import 'package:murthaji/Screens/constants.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({
    Key key,
    this.items,
    this.deliveryAddress,
    this.deliveryCost,
    this.paymentType,
    this.totalAmt,
    this.OrderId,
  });
  List<OrderItems> items;
  String deliveryCost;
  String totalAmt;
  String paymentType;
  String deliveryAddress;
  String OrderId;

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Order Number : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.OrderId ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                itemCount: widget.items.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return OrderItem(
                    name: widget.items[index].dcProdName ?? "",
                    price: widget.items[index].dcProdActualstoreprice ?? "",
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Delivery Cost',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Color(0xff4a4b4d),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('KD ' + widget.deliveryCost ?? "",
                          style: TextStyle(
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
                          style: TextStyle(
                              color: Color(0xff4a4b4d),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('Cash on delivery',
                          style: Theme.of(context).textTheme.headline6.copyWith(
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
                          style: TextStyle(
                              color: Color(0xff4a4b4d),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('KD ' + widget.totalAmt ?? "",
                          style: TextStyle(
                              color: Color(0xff4e99ba),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Delivery Address',
                      style: TextStyle(
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
                          .bodyText2
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
  OrderItem({Key key, this.name, this.price});

  String name;
  String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          color: Color(0xffD8E9F0),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: width(context) / 1.5,
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 12, color: Color(0xff4a4b4d)),
                  ),
                ),
                Spacer(),
                Text(
                  "KD " + price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff4a4b4d),
                  ),
                ),
              ],
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
