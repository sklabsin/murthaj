import 'package:flutter/material.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/addressModel.dart';
import 'package:murthaji/Screens/add_address.dart';
import 'package:murthaji/controller/spinner.dart';
import '../constants.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key key}) : super(key: key);

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Spinner(
      child: Scaffold(
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
            'Address',
            style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
          ),
        ),
        body: Container(
          color: Color(0xfff6f6f6),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: height(context) - 180,
                width: double.infinity,
                child: FutureBuilder<Address>(
                  future: AddressApis().showAddress(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Address> snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data.data;
                      return data.response.length > 0
                          ? ListView.builder(
                              itemCount: data.response.length,
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, int index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.withOpacity(.8)),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data.response[index]
                                                        .address_fname !=
                                                    ""
                                                ? data.response[index]
                                                        .address_fname +
                                                    " "
                                                : data.response[index]
                                                            .address_lname !=
                                                        null
                                                    ? data.response[index]
                                                        .address_lname
                                                    : "",
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: Color(
                                                0xff4a4b4d,
                                              ),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            data.response[index].address_name +
                                                    ", " +
                                                    data.response[index]
                                                        .address_governarate ??
                                                "",
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff4a4b4d),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  padding: EdgeInsets.all(9),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade500,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit,
                                                        size: 15,
                                                        color: Colors.white,
                                                      ),
                                                      // SizedBox(
                                                      //   width: 4,
                                                      // ),
                                                      // Text(
                                                      //   'Edit',
                                                      //   style: TextStyle(
                                                      //     color: Colors.white,
                                                      //     fontSize: 14,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () async {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddAddress(
                                                        data: data
                                                            .response[index],
                                                        update: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  padding: EdgeInsets.all(9),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade500,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .delete_outline_sharp,
                                                        size: 15,
                                                        color: Colors.white,
                                                      ),
                                                      // SizedBox(
                                                      //   width: 4,
                                                      // ),
                                                      // Text(
                                                      //   'Remove',
                                                      //   style: TextStyle(
                                                      //     color: Colors.white,
                                                      //     fontSize: 14,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () async {
                                                  showSpinner();
                                                  String x = await AddressApis()
                                                      .deleteAddress(
                                                    addressId: data
                                                        .response[index]
                                                        .address_id,
                                                  );
                                                  hideSpinner();
                                                  setState(() {});
                                                  toastFn(comment: x);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                "No Address",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
              ),
              Container(
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
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class AddressTile extends StatefulWidget {
//   AddressTile({Key key, this.data}) : super(key: key);
//   AddressResponse data;
//   @override
//   _AddressTileState createState() => _AddressTileState();
// }

// class _AddressTileState extends State<AddressTile> {
//   @override
//   Widget build(BuildContext context) {
//     // CityAndGover goverController = Get.put(CityAndGover());
//     return 
//   }
// }
