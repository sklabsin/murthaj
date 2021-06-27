import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController governarate = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController houseNum = TextEditingController();
  TextEditingController avenue = TextEditingController();
  TextEditingController mobile1 = TextEditingController();
  TextEditingController mobile2 = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Address',
            style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
          ),
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
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff2682ab),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Container(
              width: screenWidth,
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
                        hint: 'Last Name*'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: textBoxWidget(
                        type: TextInputType.name,
                        context: context,
                        controller: governarate,
                        hint: 'Governarate'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: textBoxWidget(
                        type: TextInputType.name,
                        context: context,
                        controller: area,
                        hint: 'Area'),
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
                        hint: 'Mobile 2*'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: textBoxWidget(
                        type: TextInputType.emailAddress,
                        context: context,
                        controller: email,
                        hint: 'Email Address '),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: buttonWidget(
                      color: Color(0xff005291),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAddress()));
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
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
