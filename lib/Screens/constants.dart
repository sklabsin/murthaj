import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:murthaji/controller/tabController.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color colorblue = Color(0xff2682AB);
// String imgurl = 'https://awadalmurtajijointkw.com/murtajishop_new/uploads/';
String imgurl = 'https://online.memc-eg-kw.com/uploads/';
height(context) {
  return MediaQuery.of(context).size.height;
}

width(context) {
  return MediaQuery.of(context).size.width;
}

bool loggedin;
checkLogin() async {
  var pref = await SharedPreferences.getInstance();
  if (pref.getString('uid') == null) {
    loggedin = false;
    // return false;
  } else {
    loggedin = true;
    // return true;
  }
}

ElevatedButton buttonWidget({Function() ontap, Widget text, Color color}) {
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
        child: text,
      ),
    ),
  );
}

TextBoxObscureController obscController = Get.put(TextBoxObscureController());
Container textBoxWidget({
  BuildContext context,
  TextEditingController controller,
  String hint,
  TextInputType type,
  bool pass,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    decoration: BoxDecoration(
      color: Color(0xffF2F2F2),
      borderRadius: BorderRadius.circular(50),
    ),
    child: TextField(
      controller: controller,
      keyboardType: type,
      obscureText: (pass == true) ? obscController.obsc.value : false,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: (pass != true)
            ? Container(
                height: 1,
                width: 1,
              )
            : InkWell(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  obscController.obsc.value = !obscController.obsc.value;
                },
                child: Container(
                  padding: EdgeInsets.only(right: 20),
                  height: 20,
                  width: 20,
                  child: Icon(
                    (obscController.obsc.value == true)
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    size: 28,
                  ),
                ),
              ),
        hintStyle: TextStyle(fontSize: 16, color: Color(0xffB6B7B7)),
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 25, bottom: 11, top: 20, right: 15),
      ),
    ),
  );
}

Row topSection({String heading}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        heading ?? '',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Image.asset('assets/images/cart.png')
    ],
  );
}

toastFn({String comment}) {
  return Fluttertoast.showToast(
    msg: comment ?? '',
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorblue,
    fontSize: 14,
  );
}
