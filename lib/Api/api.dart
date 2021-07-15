import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:murthaji/Model/AuthenticationModel.dart';
import 'package:murthaji/Model/CategoryPage/MainCategoryModel.dart';
import 'package:murthaji/Model/CategoryPage/subCategoryClass.dart';
import 'package:murthaji/Model/HomePage/BottomSliderModel.dart';
import 'package:murthaji/Model/HomePage/mostPopularModel.dart';
import 'package:murthaji/Model/HomePage/topSliderModel.dart';
import 'package:murthaji/Model/wishlistModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

getUrl(String s) => Uri.parse(
    "https://awadalmurtajijointkw.com/murtajishop_new/index.php/Api/$s");
Future userId() async {
  var pref = await SharedPreferences.getInstance();
  return pref.getString('uid');
}

class Authentication {
  Future<AuthenticationClass> registrationApi({
    String fname,
    String lname,
    String email,
    String pass,
    String cpass,
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
    String email,
    String pass,
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
    String email,
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

  Future<BottomSliderClass> bottomSliderApi({String id}) async {
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

class CategoryApi {
  Future<MainCategoryModel> mainCategory() async {
    final response = await http.post(getUrl('allcategories'), body: {});
    // print(response.body);
    try {
      return mainCategoryModelFromJson(response.body);
    } catch (e) {
      print(e);
      return MainCategoryModel();
    }
  }

  Future<SubCategoryClass> subCategory({String id}) async {
    print(id);
    print('abcsss');
    final response = await http.post(getUrl('category_sub_products'), body: {
      "cat_id": "25",
    });
    // print(response.body);
    try {
      return subCategoryClassFromJson(response.body);
    } catch (e) {
      print(e);
      return SubCategoryClass();
    }
  }
}

class FavouriteSection {
  Future<WishlistClass> addfavourite({String pid}) async {
    var id = await userId();
    // print(pid);
    // print(id);
    final response = await http.post(getUrl('addWishlist'), body: {
      "user_id": id,
      "pid": pid,
    });
    try {
      WishlistClass data = wishlistClassFromJson(response.body);
      Fluttertoast.showToast(msg: "${data.data.message}");
      return data;
    } catch (e) {
      print(e);
      return WishlistClass();
    }
  }

  Future<WishlistClass> removefavourite({String pid}) async {
    var id = await userId();
    final response = await http.post(getUrl('removeWishlist'), body: {
      "user_id": id,
      "pid": pid,
    });
    print(response.body);
    try {
      WishlistClass data = wishlistClassFromJson(response.body);
      Fluttertoast.showToast(msg: "${data.data.message}");
      return data;
    } catch (e) {
      print(e);
      return WishlistClass();
    }
  }
}

Future<String> updateProfile(
    {String pass,
    String cpass,
    String fname,
    String lname,
    String email}) async {
  var id = await userId();
  final response = await http.post(getUrl('edit_profile'), body: {
    "user_id": '130',
    "newpassword": pass,
    "confirmpassword": cpass,
    "fname": fname,
    "lastname": lname,
    "email": email
  });
  print(response.body);
  try {
    if ((jsonDecode(response.body)['data']['status']) == '200') {
      return jsonDecode(response.body)['data']['response'];
    } else {
      return 'noo';
    }
  } catch (e) {
    print(e);
  }
}
