import 'package:flutter/material.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/addressModel.dart';
import 'package:murthaji/Model/OrderSection/orderCheckModel.dart';
import 'package:murthaji/Screens/PurchaseSection/CheckOutPage.dart';
import 'package:murthaji/Screens/constants.dart';
import '../add_address.dart';

class SelectAddressPage extends StatefulWidget {
  SelectAddressPage({Key key, this.coupon});
  String coupon;

  @override
  _SelectAddressPageState createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  TextEditingController code = TextEditingController();
  int selectedIndex = 0;
  String selectedAddressId;

  @override
  Widget build(BuildContext context) {
    String totalPrice = "100";
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff4a4b4d),
            size: 18,
          ),
        ),
        title: Text(
          'Select Address',
          style: TextStyle(
            color: Color(0xff4a4b4d),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  widget.coupon.isEmpty
                      ? Container()
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                            color: colorblue,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Coupon Code :',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.coupon ?? "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Delivery Address',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FutureBuilder<Address>(
                    future: AddressApis().showAddress(),
                    builder: (BuildContext context,
                        AsyncSnapshot<Address> snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data?.data;
                        (selectedAddressId == null)
                            ? selectedAddressId =
                                snapshot.data.data.response[0].address_id
                            : null;
                        return data.response.length > 0
                            ? Container(
                                padding: EdgeInsets.only(bottom: 10),
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: data.response.length,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, int index) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Material(
                                        elevation: 2,
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: EdgeInsets.only(
                                            right: 5,
                                            left: 5,
                                            top: 5,
                                            bottom: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "${data.response[index].address_fname}" +
                                                            "  " +
                                                            "${data.response[index].address_lname}" ??
                                                        "",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff4a4b4d,
                                                      ),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    data.response[index]
                                                            .address_city +
                                                        ", " +
                                                        data.response[index]
                                                            .address_governarate,
                                                    // maxLines: 2,
                                                    style: TextStyle(
                                                      color: Color(0xff4a4b4d),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Radio(
                                                    activeColor: colorblue,
                                                    value: index,
                                                    groupValue: selectedIndex,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedIndex = value;
                                                        selectedAddressId = data
                                                            .response[index]
                                                            .address_id;
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddAddress(
                                                                      check:
                                                                          true),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10,
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.red[900],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.add,
                                                                size: 15,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              SizedBox(
                                                                width: 4,
                                                              ),
                                                              Text(
                                                                'Add',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddAddress(
                                                                      data: data
                                                                              .response[
                                                                          index],
                                                                      update:
                                                                          true,
                                                                      check:
                                                                          true),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 5,
                                                            vertical: 5,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.red[900],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.edit,
                                                                size: 15,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              SizedBox(
                                                                width: 4,
                                                              ),
                                                              Text(
                                                                'Edit',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // InkWell(
                                                  //   onTap: () {
                                                  //   },
                                                  //   child: Text(
                                                  //     'Edit',
                                                  //     style: TextStyle(
                                                  //       color:
                                                  //           Color(0xff2682AB),
                                                  //       fontSize: 14,
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                color: Colors.white,
                                child: buttonWidget(
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddAddress(),
                                      ),
                                    );
                                  },
                                  text: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        'Add New',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: colorblue,
                          ),
                        );
                      }
                      // By default, show a loading spinner.
                    },
                  ),
                  SizedBox(
                    height: 35,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: InkWell(
                onTap: () async {
                  OrderCheckClass data = await orderCheckApi(
                    add_id: selectedAddressId,
                    coupon: widget.coupon,
                  );
                  if (data.data.status == '200') {
                    // print(data.data.response.comments);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOut(
                          deliveryPrice: data.data.response.deliveryCharge,
                          discount: data.data.response.discount,
                          price: data.data.response.cartamount,
                          addr_id: selectedAddressId,
                          coupon: widget.coupon,
                        ),
                      ),
                    );
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
                      'Check Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
