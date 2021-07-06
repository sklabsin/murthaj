import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:murthaji/Model/AuthenticationModel.dart';
import 'package:murthaji/Model/HomePage/BottomSliderModel.dart';
import 'package:murthaji/Model/HomePage/mostPopularModel.dart';
import 'package:murthaji/Model/HomePage/topSliderModel.dart';

getUrl(String s) => Uri.parse(
    "https://awadalmurtajijointkw.com/murtajishop_new/index.php/Api/$s");

class Authentication {
  Future<AuthenticationClass> registrationApi({
    String? fname,
    String? lname,
    String? email,
    String? pass,
    String? cpass,
  }) async {
    final response = await http.post(getUrl('signup'), body: {
      "regfname": fname,
      "reglname": lname,
      "regmail": email,
      "regpswd": pass,
      "regcpswd": cpass
    });

    print(response.body);

    try {
      return authenticationClassFromJson(response.body);
    } catch (e) {
      print(e);
      return AuthenticationClass();
    }
  }

  Future<AuthenticationClass> loginApi({
    String? email,
    String? pass,
  }) async {
    final response = await http.post(getUrl('login'), body: {
      "username": email,
      "password": pass,
    });

    print(response.body);

    try {
      return authenticationClassFromJson(response.body);
    } catch (e) {
      print(e);
      return AuthenticationClass();
    }
  }

  Future<String> forgotPasswordApi({
    String? email,
  }) async {
    final response = await http.post(getUrl('forgotpassword'), body: {
      "email": email,
    });

    print(response.body);

    try {
      return jsonDecode(response.body)['data']['message'];
    } catch (e) {
      print(e);
      return '';
    }
  }
}

class Home {
  Future<MostPopularClass> mostPopularApi() async {
    final response = await http.post(getUrl('most_popluar_product'), body: {});
    // print(response.body);
    try {
      return mostPopularClassFromJson(response.body);
    } catch (e) {
      print(e);
      return MostPopularClass();
    }
  }

  Future<MostPopularClass> newArrivalsApi() async {
    final response = await http.post(getUrl('new_arrivals'), body: {});
    // print(response.body);
    try {
      return mostPopularClassFromJson(response.body);
    } catch (e) {
      print(e);
      return MostPopularClass();
    }
  }

  Future<TopSliderClass> topSliderApi() async {
    final response = await http.post(getUrl('slider_api'), body: {});
    // print(response.body);
    try {
      return topSliderClassFromJson(response.body);
    } catch (e) {
      print(e);
      return TopSliderClass();
    }
  }

  Future<BottomSliderClass> bottomSliderApi() async {
    final response = await http.post(getUrl('middle_slider'), body: {});
    // print(response.body);
    try {
      return bottomSliderClassFromJson(response.body);
    } catch (e) {
      print(e);
      return BottomSliderClass();
    }
  }
}
