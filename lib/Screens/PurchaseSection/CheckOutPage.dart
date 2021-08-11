import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/OrderSection/orderConfirmModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/tabScreen.dart';
import 'package:murthaji/controller/cartController.dart';
import 'package:murthaji/controller/tabController.dart';
import '../MorePages/my_order.dart';

class CheckOut extends StatefulWidget {
  CheckOut({
    Key key,
    this.deliveryPrice,
    this.price,
    this.discount,
    this.addr_id,
    this.coupon,
    this.totalprice,
  });
  String price;
  int discount;
  int deliveryPrice;
  String addr_id;
  String coupon;
  double totalprice;

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  // String totalPrice = "100";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff4a4b4d),
          ),
        ),
        title: Text(
          'Check Out',
          style: TextStyle(
            color: Color(0xff4a4b4d),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Payment Method',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
                    decoration: BoxDecoration(
                      color: Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Cash on delivery',
                            style: TextStyle(fontSize: 14)),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Sub Total',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
                      Text('KD ' + widget.price,
                          style: TextStyle(
                              color: Color(0xff4a4b4d),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Delivery charge',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
                      Text('KD ' + widget.deliveryPrice.toString(),
                          style: TextStyle(
                              color: Color(0xff4a4b4d),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
                      Text(
                        'KD ' + widget.discount.toString(),
                        style: TextStyle(
                            color: Color(0xff4a4b4d),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    height: 40,
                    thickness: 2,
                    color: Color(0xfff6f6f6),
                  ),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
                      Text(
                        'KD ' + widget.totalprice.toString() ?? "",
                        style: TextStyle(
                            color: Color(0xff4a4b4d),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Container(
              height: 15,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () async {
                        OrderConfirmClass data = await orderConfirmApi(
                          coupon: widget.coupon,
                          add_id: widget.addr_id,
                        );
                        if (data.data.status == '200') {
                          confirmBooking(context);
                        } else {
                          toastFn(comment: data.data.message);
                        }
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff2682ab),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> confirmBooking(BuildContext context) {
    CartListController cartListcontroller = Get.put(CartListController());
    TabPageController controller = Get.put(TabPageController());
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )),
              Container(
                width: 225,
                height: 240,
                child: SvgPicture.asset('assets/images/congrats.svg'),
              ),
              SizedBox(
                height: 18,
              ),
              Text('Thank You!',
                  style: TextStyle(
                      color: Color(0xff4a4b4d),
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Text('for your order',
                  style: TextStyle(
                      color: Color(0xff4a4b4d),
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Your Order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your Order',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  await cartListcontroller.fetchCartItemsList();
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyOrder(),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xff2682ab),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'My Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  controller.currenttab.value = 2;
                  await cartListcontroller.fetchCartItemsList();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tabscreen(),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  child: Center(
                    child: Text('Back To Home',
                        style: TextStyle(
                            color: Color(0xff4a4b4d),
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
