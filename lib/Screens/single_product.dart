import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/HomePage/mostPopularModel.dart';
import 'package:murthaji/Model/cartModel.dart';
import 'package:murthaji/Model/singleProductModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/seeAllPage.dart';
import 'package:murthaji/Screens/tabScreen.dart';
import 'package:murthaji/controller/cartController.dart';
import 'package:murthaji/controller/quantityController.dart';
import 'package:murthaji/controller/spinner.dart';
import 'package:murthaji/controller/tabController.dart';
import 'package:murthaji/extras/Bottomsheet.dart';
import 'package:murthaji/extras/gridViewLoading.dart';
import 'package:murthaji/extras/likeButton.dart';
import 'TabBarScreens.dart/homePage.dart';

class SingleProduct extends StatefulWidget {
  SingleProduct({Key key, this.pro_id});
  String pro_id;

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  QuantitySection controller = Get.put(QuantitySection());
  TabPageController tabcontroller = Get.put(TabPageController());
  CartListController cartListcontroller = Get.put(CartListController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.qty.value = 1;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Spinner(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<SingleProductClass>(
            future: loggedin
                ? singleProductLoginApi(pid: widget.pro_id ?? '')
                : singleProductApi(pid: widget.pro_id ?? ''),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data.data.response;
                return Stack(
                  children: <Widget>[
                    Container(
                      height: height(context) * 0.7,
                      width: width(context),
                      child: Image.network(
                          "$imgurl" + "${data.productImage.split(',')[0]}"),
                    ),
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        actions: [
                          loggedin
                              ? InkWell(
                                  onTap: () {
                                    tabcontroller.currenttab.value = 1;
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Tabscreen(),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                          height: 40,
                                          child: Image.asset(
                                              'assets/images/cart.png')),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Obx(
                                          () => Badge(
                                            position: BadgePosition.topEnd(
                                                top: 0, end: 3),
                                            badgeContent: Text(
                                              cartListcontroller.itemcount.value
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    bottomsheet(context: context);
                                  },
                                  child: Image.asset('assets/images/cart.png'),
                                ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
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
                                  padding: EdgeInsets.only(
                                      top: 20, right: 20, left: 20),
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              EasyLocalization.of(context)
                                                          .currentLocale ==
                                                      Locale('en', 'US')
                                                  ? data.productName ?? ''
                                                  : data.productNameArab ?? "",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          loggedin
                                              ? Container(
                                                  width: 30,
                                                  height: 30,
                                                  child: LikeSection(
                                                    pid: data.productId,
                                                    wishlistStatus:
                                                        data.wishlistStatus,
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    bottomsheet(
                                                        context: context);
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 40,
                                                    padding: EdgeInsets.only(
                                                        right: 10, top: 10),
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            color: Color(0xff4a4b4d),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data.productShortDesc ?? "",
                                        style: TextStyle(
                                          color: Color(0xff7c7d7e),
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'KD ' + data.productSellPrice ?? "",
                                          style: TextStyle(
                                              color: Color(0xff4a4b4d),
                                              fontSize: 31,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (int.parse(data
                                                      .productSingleQuantity) >
                                                  0) {
                                                if (controller.qty.value > 1) {
                                                  controller.qty.value -= 1;
                                                }
                                              } else {
                                                toastFn(
                                                    comment: 'Out of Stock');
                                              }
                                            },
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Color(0xff2682ab)),
                                              ),
                                              width: 55,
                                              height: 30,
                                              child: Center(
                                                child: Obx(
                                                  () => Text(
                                                    (int.parse(data
                                                                .productSingleQuantity) >
                                                            0)
                                                        ? "${controller.qty.value}"
                                                        : "0",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (int.parse(data
                                                      .productSingleQuantity) >
                                                  0) {
                                                if (int.parse(data
                                                        .productSingleQuantity) >
                                                    controller.qty.value) {
                                                  controller.qty.value += 1;
                                                  // print(controller.qty.value);
                                                } else {
                                                  toastFn(
                                                    comment: 'Only ' +
                                                        data.productSingleQuantity +
                                                        " items ",
                                                  );
                                                }
                                              } else {
                                                toastFn(
                                                    comment: 'Out of Stock');
                                              }
                                            },
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
                                          loggedin
                                              ? InkWell(
                                                  onTap: () async {
                                                    if (int.parse(data
                                                            .productSingleQuantity) >
                                                        0) {
                                                      if (controller.qty.value >
                                                          0) {
                                                        showSpinner();
                                                        CartModel d = (data
                                                                    .cartStatus ==
                                                                '1')
                                                            ? await CartSectionApi()
                                                                .updateCart(
                                                                cid:
                                                                    data.cartId,
                                                                pid: data
                                                                    .productId,
                                                                qty: controller
                                                                    .qty.value
                                                                    .toString(),
                                                              )
                                                            : await CartSectionApi()
                                                                .addCart(
                                                                pid: data
                                                                    .productId,
                                                                qty: controller
                                                                    .qty.value
                                                                    .toString(),
                                                              );

                                                        await cartListcontroller
                                                            .fetchCartItemsList();
                                                        hideSpinner();
                                                        if (d.data.status ==
                                                            '200') {
                                                          setState(() {});
                                                          await toastFn(
                                                              comment: d.data
                                                                  .response);
                                                        } else {
                                                          toastFn(
                                                            comment:
                                                                d.data.response,
                                                          );
                                                        }
                                                      } else {
                                                        toastFn(
                                                            comment:
                                                                'Please add quantity of items and proceed');
                                                      }
                                                    } else {
                                                      toastFn(
                                                          comment:
                                                              'Out of Stock');
                                                    }
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Container(
                                                      color: Color(0xff1c477a),
                                                      height: 30,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 16,
                                                            height: 14,
                                                            child: Image.asset(
                                                                'assets/images/add_cart.png'),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              'Add to Cart',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () async {
                                                    bottomsheet(
                                                        context: context);
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15,
                                                              vertical: 10),
                                                      decoration: BoxDecoration(
                                                          color: colorblue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            15,
                                                          )),
                                                      child: Text(
                                                        'Add To Cart',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      FutureBuilder<MostPopularClass>(
                                          future: Home().mostPopularApi(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<MostPopularClass>
                                                  snapshot) {
                                            if (snapshot.hasData) {
                                              var data = snapshot.data?.data;

                                              return Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 17),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Most Popular',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SeeAllPage(
                                                                  data: snapshot
                                                                      .data,
                                                                  txt:
                                                                      'Most Popular',
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'View all',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: Color(
                                                                  0xffFC6011),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Divider(),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 300,
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      // itemCount: snapshot.data!.data!.response!.length,
                                                      itemCount: 5,
                                                      physics:
                                                          AlwaysScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, int index) {
                                                        return Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          width:
                                                              width(context) *
                                                                      .5 -
                                                                  10,
                                                          child: CardWidget(
                                                            data: data.response[
                                                                index],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return loadingIndicatorGridView();
                                            }
                                          }),
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
                );
              } else
                return Center(
                    child: CircularProgressIndicator(
                  color: colorblue,
                ));
            }),
      ),
    );
  }
}
