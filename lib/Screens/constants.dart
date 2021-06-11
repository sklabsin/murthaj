import 'package:flutter/material.dart';

Color colorblue = Color(0xff2682AB);

ElevatedButton buttonWidget({Function ontap, String text}) {
  return ElevatedButton(
    onPressed: ontap,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xff2682AB)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    child: Container(
      height: 56,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}

Container textBoxWidget(
    {BuildContext context, TextEditingController controller, String hint}) {
  return Container(
    width: MediaQuery.of(context).size.width,
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
