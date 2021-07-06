import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color colorblue = Color(0xff2682AB);
String imgurl = 'https://awadalmurtajijointkw.com/murtajishop_new/uploads/';
height(context) {
  return MediaQuery.of(context).size.height;
}

width(context) {
  return MediaQuery.of(context).size.width;
}

ElevatedButton buttonWidget({Function()? ontap, Widget? text, Color? color}) {
  Color colors = (color == null) ? Color(0xff2682AB) : color;
  return ElevatedButton(
    onPressed: ontap,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(colors),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    child: Container(
      height: 56,
      child: Center(
        child: text!,
      ),
    ),
  );
}

Container textBoxWidget({
  BuildContext? context,
  TextEditingController? controller,
  String? hint,
  TextInputType? type,
}) {
  return Container(
    width: MediaQuery.of(context!).size.width,
    height: 60,
    decoration: BoxDecoration(
      color: Color(0xffF2F2F2),
      borderRadius: BorderRadius.circular(50),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16, color: Color(0xffB6B7B7)),
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 25, bottom: 11, top: 20, right: 15),
      ),
    ),
  );
}

Row topSection({String? heading}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        heading!,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Image.asset('assets/images/cart.png')
    ],
  );
}

toastFn({String? comment}) {
  return Fluttertoast.showToast(
    msg: comment!,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorblue,
    fontSize: 14,
  );
}
