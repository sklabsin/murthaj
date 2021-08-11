import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:murthaji/Screens/PurchaseSection/SelectAddressPage.dart';
import 'package:murthaji/controller/cityAndGovernarate.dart';
import 'constants.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/controller/spinner.dart';
import 'package:murthaji/Screens/MorePages/Address.dart';
import 'package:murthaji/Model/addressModel.dart';

class AddAddress extends StatefulWidget {
  AddAddress({Key key, this.data, this.update, this.check});
  AddressResponse data;
  bool update;
  bool check;

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  String selectedGovernarate = 'india';
  String selectedArea = '';
  TextEditingController block = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController houseNum = TextEditingController();
  TextEditingController avenue = TextEditingController();
  TextEditingController mobile1 = TextEditingController();
  TextEditingController mobile2 = TextEditingController();
  TextEditingController email = TextEditingController();
  CityAndGover goverController = Get.put(CityAndGover());
  void initState() {
    Future.delayed(Duration(microseconds: 5)).then((value) async {
      await checkLogin();
      await goverController.fetchGover();
      // print(loggedin);
    });
    if (widget.data != null) {
      firstName.text = widget.data.address_fname ?? "";
      lastName.text = widget.data.address_lname ?? "";
      selectedGovernarate = widget.data.address_governarate ?? "";
      selectedArea = widget.data.address_city ?? "";
      block.text = widget.data.address_block ?? "";
      streetAddress.text = widget.data.address_street ?? "";
      avenue.text = widget.data.address_avanue ?? '';
      houseNum.text = widget.data.address_hb ?? "";
      mobile1.text = widget.data.address_mobile1 ?? "";
      mobile2.text = widget.data.address_mobile2 ?? "";
      email.text = widget.data.address_mail ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Spinner(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Address',
            style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              widget.check == true
                  ? Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectAddressPage(
                          coupon: '',
                        ),
                      ),
                    )
                  : Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressList(),
                      ),
                    );
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 18.0,
              color: Color(0xff1c477a),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Color(0xff2682ab),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            width: width(context),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Add New Address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                      type: TextInputType.name,
                      context: context,
                      controller: firstName,
                      hint: 'First Name*'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                    type: TextInputType.name,
                    context: context,
                    controller: lastName,
                    hint: 'Last Name*',
                  ),
                ),
                Obx(
                  () => goverController.goverList.value.length == 0
                      ? Container()
                      : Container(
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.centerLeft,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                hint: Text('Governarate'),
                                value: goverController.selectedGovern.value,
                                icon: Container(),
                                iconSize: 24,
                                elevation: 16,
                                onChanged: (String newValue) async {
                                  goverController.selectedGovern.value =
                                      newValue;
                                  showSpinner();
                                  goverController.cityList.value.clear();
                                  await goverController.fetchCity(
                                      gov:
                                          goverController.selectedGovern.value);
                                  goverController.selectedCity.value =
                                      goverController.cityList.value[0];
                                  hideSpinner();
                                },
                                items: goverController.goverList.value
                                        .map<DropdownMenuItem<String>>(
                                            (String val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Container(
                                          width: width(context) - 120,
                                          child: Text(val),
                                        ),
                                      );
                                    }).toList() ??
                                    [],
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => goverController.cityList.value.length == 0
                      ? Container()
                      : Container(
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.centerLeft,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                hint: Text('Area'),
                                value: goverController.selectedCity.value,
                                icon: Container(),
                                iconSize: 24,
                                elevation: 16,
                                onChanged: (String newValue) async {
                                  goverController.selectedCity.value = newValue;
                                },
                                items: goverController.cityList.value
                                        .map<DropdownMenuItem<String>>(
                                            (String val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Container(
                                          width: width(context) - 120,
                                          child: Text(val),
                                        ),
                                      );
                                    }).toList() ??
                                    [],
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                      type: TextInputType.name,
                      context: context,
                      controller: block,
                      hint: 'Block'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                      type: TextInputType.name,
                      context: context,
                      controller: streetAddress,
                      hint: 'Street Address*'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                      type: TextInputType.number,
                      context: context,
                      controller: houseNum,
                      hint: 'House/Building No*'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                    type: TextInputType.name,
                    context: context,
                    controller: avenue,
                    hint: 'Avenue',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                      type: TextInputType.number,
                      context: context,
                      controller: mobile1,
                      hint: 'Mobile 1*'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                      type: TextInputType.number,
                      context: context,
                      controller: mobile2,
                      hint: 'Mobile 2 '),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: textBoxWidget(
                    type: TextInputType.emailAddress,
                    context: context,
                    controller: email,
                    hint: 'Email Address *',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: buttonWidget(
                    color: Color(0xff005291),
                    ontap: () async {
                      if (firstName.text.isNotEmpty &&
                          lastName.text.isNotEmpty &&
                          streetAddress.text.isNotEmpty &&
                          houseNum.text.isNotEmpty &&
                          mobile1.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          goverController.selectedGovern.value.isNotEmpty) {
                        if (mobile2.text.isEmpty
                            ? (mobile1.text.length < 13 &&
                                mobile1.text.length > 9)
                            : (mobile1.text.length < 13 &&
                                mobile1.text.length > 9 &&
                                mobile2.text.length < 13 &&
                                mobile2.text.length > 9)) {
                          showSpinner();
                          String data = widget.update == true
                              ? await AddressApis().updateAddress(
                                  adrfirstName: firstName.text,
                                  adrlastName: lastName.text,
                                  adremail: email.text,
                                  adrphon: mobile1.text,
                                  adrphon2: mobile2.text,
                                  adravenue: avenue.text,
                                  adrarea: goverController.selectedCity.value,
                                  adrstreet: streetAddress.text,
                                  adrBlock: block.text,
                                  adrhouse: houseNum.text,
                                  adrgovernarate:
                                      goverController.selectedGovern.value,
                                  addressId: widget.data.address_id,
                                )
                              : await AddressApis().addAddress(
                                  adrfirstName: firstName.text,
                                  adrlastName: lastName.text,
                                  adremail: email.text,
                                  adrphon: mobile1.text,
                                  adrphon2: mobile2.text,
                                  adravenue: avenue.text,
                                  adrarea: goverController.selectedCity.value,
                                  adrstreet: streetAddress.text,
                                  adrBlock: block.text,
                                  adrhouse: houseNum.text,
                                  adrgovernarate:
                                      goverController.selectedGovern.value,
                                );
                          hideSpinner();
                          var respData = jsonDecode(data)["data"];
                          // print(respData);
                          if (respData["status"] == '200') {
                            toastFn(comment: respData["message"]);
                            widget.check == true
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectAddressPage(
                                        coupon: '',
                                      ),
                                    ),
                                  )
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddressList(),
                                    ),
                                  );
                          } else if (respData["status"] == '100') {
                            toastFn(comment: respData["message"]);
                          } else {
                            CircularProgressIndicator(
                              color: colorblue,
                            );
                          }
                        } else {
                          return toastFn(
                              comment:
                                  "Check your mobile number(9< number >13)");
                        }
                      } else
                        return toastFn(
                            comment:
                                'Fill all required feilds (* shows compulsory feilds)');
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
                          widget.update == true ? 'update' : 'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
