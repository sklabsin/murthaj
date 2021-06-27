import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:murthaji/Model/AuthenticationModel.dart';

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
