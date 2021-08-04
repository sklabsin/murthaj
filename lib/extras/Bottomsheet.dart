import 'package:flutter/material.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/Screens/loginPage.dart';

void bottomsheet({BuildContext context}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 180,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: colorblue,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Login to access these features',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Do you want to Continue.. Click Yes to LOGIN'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 130,
                  child: buttonWidget(
                    ontap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (route) => false);
                    },
                    text: Text('YES'),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 40,
                  width: 130,
                  child: buttonWidget(
                    ontap: () {
                      Navigator.pop(context);
                    },
                    text: Text('NO'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
