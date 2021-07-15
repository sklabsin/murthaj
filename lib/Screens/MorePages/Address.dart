import 'package:flutter/material.dart';
import 'package:murthaji/Screens/add_address.dart';
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
    return Scaffold(
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
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Color(0xff4a4b4d), fontSize: 25),
        ),
      ),
      body: Container(
        color: Color(0xfff6f6f6),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 150,
              width: double.infinity,
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return AddressTile();
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: buttonWidget(
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAddress()));
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
          ],
        ),
      ),
    );
  }
}

class AddressTile extends StatelessWidget {
  const AddressTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.white,
      height: 105,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('sharq Kuwait',
              maxLines: 2,
              style: TextStyle(
                  color: Color(
                    0xff4a4b4d,
                  ),
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5,
          ),
          Text(
            '653 Nostrand Ave., \nBrooklyn, NY 11216',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff4a4b4d),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Change',
                style: TextStyle(
                  color: Color(0xff2682AB),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
