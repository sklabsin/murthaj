import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/DisplayCartModel.dart';
import 'package:murthaji/Model/cartModel.dart';
import 'package:murthaji/controller/cartController.dart';
import 'package:murthaji/controller/spinner.dart';
import '../PurchaseSection/SelectAddressPage.dart';
import '../constants.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController coupon = TextEditingController();
  CartListController cartListcontroller = Get.put(CartListController());
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(microseconds: 5)).then((value) async {
      await cartListcontroller.fetchCartItemsList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Text(''),
        title: Text(
          'Cart',
          style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
        ),
      ),
      body: Spinner(
        child: Container(
          height: height(context),
          width: width(context),
          child: SingleChildScrollView(
            child: FutureBuilder<CartDisplayClass>(
              future: CartSectionApi().displayCart(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // var data = snapshot.data.data.response;
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      (cartListcontroller.cartItems.length > 0)
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: cartListcontroller.cartItems.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: width(context),
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Slidable(
                                      actionPane: SlidableDrawerActionPane(),
                                      actionExtentRatio: 0.18,
                                      secondaryActions: <Widget>[
                                        SlideAction(
                                          onTap: () async {
                                            showSpinner();
                                            CartModel data =
                                                await CartSectionApi()
                                                    .removeFromCart(
                                                        cart_id:
                                                            cartListcontroller
                                                                .cartItems[
                                                                    index]
                                                                .cartId);
                                            if (data.data.status == '200') {
                                              cartListcontroller.cartItems
                                                  .removeAt(index);
                                              await cartListcontroller
                                                  .fetchCartItemsList();
                                              hideSpinner();
                                              toastFn(
                                                  comment: data.data.response);
                                            } else {
                                              hideSpinner();
                                              toastFn(
                                                  comment: data.data.response);
                                            }
                                          },
                                          child: Container(
                                            width: 65,
                                            margin: EdgeInsets.only(
                                                right: 5, top: 3, bottom: 3),
                                            decoration: BoxDecoration(
                                              color: colorblue,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.delete_outline_rounded,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                      child: Container(
                                        height: 92,
                                        width: width(context),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        color: Color(0xfff8f8f8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                color: Colors.white,
                                                child: Image.network('$imgurl' +
                                                    '${cartListcontroller.cartItems[index].productImage.split(',')[0]}'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Container(
                                                width: 165,
                                                child: Text(
                                                  EasyLocalization.of(context)
                                                              .currentLocale ==
                                                          Locale('en', 'US')
                                                      ? cartListcontroller
                                                              .cartItems[index]
                                                              .productName ??
                                                          ""
                                                      : cartListcontroller
                                                              .cartItems[index]
                                                              .productNameArab ??
                                                          "",
                                                  style: TextStyle(
                                                    color: Color(0xff2682AB),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                'KD ' +
                                                        cartListcontroller
                                                            .cartItems[index]
                                                            .totalPrice ??
                                                    "",
                                                style: TextStyle(
                                                  color: Color(0xff2682AB),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text('Empty Cart'),
                            ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: textBoxWidget(
                                    hint: 'Apply Discount Code',
                                    context: context,
                                    controller: coupon,
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                // Text(
                                //   'Apply',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 16,
                                //     color: Colors.greenAccent,
                                //   ),
                                // ),
                                SizedBox(
                                  width: 0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width(context),
                              height: 60,
                              padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
                              decoration: BoxDecoration(
                                color: Color(0xffF2F2F2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Delivery Type',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Cash On Delivery',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: colorblue,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(60),
                                      child: CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text('Total',
                                    style: TextStyle(
                                        color: Color(0xff4a4b4d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                cartListcontroller.cartItems.length == 0
                                    ? Text(
                                        'KD 0',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Color(0xff1c477a)),
                                      )
                                    : Text(
                                        'KD ' + snapshot.data.data.grandTotal ??
                                            "",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Color(0xff1c477a)),
                                      )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            InkWell(
                              onTap: () {
                                cartListcontroller.cartItems.length == 0
                                    ? toastFn(
                                        comment:
                                            'Cart Empty.... Add products please')
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SelectAddressPage(
                                            coupon: coupon.text ?? "",
                                          ),
                                        ),
                                      );
                              },
                              child: Container(
                                width: width(context),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff2682ab),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text('Select Address',
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
                  );
                } else
                  return Container(
                    width: width(context),
                    height: height(context) - 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: colorblue,
                      ),
                    ),
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
