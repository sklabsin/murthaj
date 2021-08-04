import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:murthaji/Model/CitiesModel.dart';
import 'package:murthaji/Model/ExtrasModel/AboutModel.dart';
import 'package:murthaji/Model/AuthenticationModel.dart';
import 'package:murthaji/Model/CategoryPage/MainCategoryModel.dart';
import 'package:murthaji/Model/CategoryPage/subCategoryClass.dart';
import 'package:murthaji/Model/ExtrasModel/ContactUsModel.dart';
import 'package:murthaji/Model/DisplayCartModel.dart';
import 'package:murthaji/Model/DisplayWishlistModel.dart';
import 'package:murthaji/Model/ExtrasModel/PrivacyModel.dart';
import 'package:murthaji/Model/GovernarateModel.dart';
import 'package:murthaji/Model/HomePage/BottomSliderModel.dart';
import 'package:murthaji/Model/HomePage/homeMainCategoryModel.dart';
import 'package:murthaji/Model/HomePage/mostPopularModel.dart';
import 'package:murthaji/Model/HomePage/topSliderModel.dart';
import 'package:murthaji/Model/OrderSection/orderConfirmModel.dart';
import 'package:murthaji/Model/addressModel.dart';
import 'package:murthaji/Model/cartModel.dart';
import 'package:murthaji/Model/OrderSection/orderCheckModel.dart';
import 'package:murthaji/Model/OrderSection/orderHistoryModel.dart';
import 'package:murthaji/Model/profileModel.dart';
import 'package:murthaji/Model/singleProductModel.dart';
import 'package:murthaji/Model/wishlistModel.dart';
import 'package:murthaji/Screens/constants.dart';
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

    // print(response.body);

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

    // print(response.body);

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

    // print(response.body);

    try {
      return jsonDecode(response.body)['data']['message'];
    } catch (e) {
      print(e);
      return '';
    }
  }
}

class Home {
  Future<HomeMainCategoryModel> mainCategoryApi() async {
    final response = await http.post(getUrl('allcategories'), body: {});
    // print(response.body);
    try {
      return homeMainCategoryModelFromJson(response.body);
    } catch (e) {
      print(e);
      return HomeMainCategoryModel();
    }
  }

  Future<MostPopularClass> searchProductApi({String keyword}) async {
    final response = await http.post(getUrl('search_product'), body: {
      // "search_name": keyword,
      "search_name": "light",
    });
    // print(response.body);
    try {
      return mostPopularClassFromJson(response.body);
    } catch (e) {
      print(e);
      return MostPopularClass();
    }
  }

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
    final response = await http.post(getUrl('category_sub_products'), body: {
      "cat_id": id,
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
    // print(response.body);
    try {
      WishlistClass data = wishlistClassFromJson(response.body);
      Fluttertoast.showToast(msg: "${data.data.message}");
      return data;
    } catch (e) {
      print(e);
      return WishlistClass();
    }
  }

  Future<WishlistDisplayClass> displayWishlist() async {
    var id = await userId();
    final response = await http.post(getUrl('show_wishlist'), body: {
      "user_id": id,
      //change
    });
    // print(response.body);
    try {
      return wishlistDisplayClassFromJson(response.body);
    } catch (e) {
      print(e);
      return WishlistDisplayClass();
    }
  }
}

class CartSectionApi {
  Future<CartModel> addCart({
    String pid,
    String qty,
  }) async {
    var id = await userId();
    print('add to cart');
    print(id);
    print(qty);
    print(pid);
    final response = await http.post(getUrl('addtocart'), body: {
      "user_id": id,
      "product_id": pid,
      "quantity": qty,
    });
    // print(response.body);

    try {
      var data = cartModelFromJson(response.body);
      return data;
    } catch (e) {
      print(e);
      return CartModel();
    }
  }

  Future<CartModel> updateCart({
    String pid,
    String qty,
    String cid,
  }) async {
    var id = await userId();
    print('Update Cart');
    print(pid);
    print(qty);
    print(id);
    print(cid);
    final response = await http.post(getUrl('updatecart'), body: {
      "user_id": id,
      "product_id": pid,
      "quantity": qty,
      "cid": cid,
    });

    try {
      var data = cartModelFromJson(response.body);

      return data;
    } catch (e) {
      print(e);
      return CartModel();
    }
  }

  Future<CartDisplayClass> displayCart() async {
    var id = await userId();
    // print(id + 'cart');
    final response = await http.post(getUrl('display_cart'), body: {
      "user_id": id,
      //change
    });
    // print(response.body);
    try {
      return cartDisplayClassFromJson(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future<CartModel> removeFromCart({
    String cart_id,
  }) async {
    var id = await userId();
    final response = await http.post(getUrl('removeitemcart'), body: {
      "user_id": id,
      "cid": cart_id,
      //change
    });
    // print(response.body);
    try {
      return cartModelFromJson(response.body);
    } catch (e) {
      print(e);
      return CartModel();
    }
  }
}

class Extras {
  Future<AboutModel> aboutApi() async {
    final response = await http.post(getUrl('about'), body: {});
    // print(response.body);
    try {
      return aboutModelFromJson(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future<PrivacyModel> privacyApi() async {
    final response = await http.post(getUrl('terms'), body: {});
    // print(response.body);
    try {
      return privacyModelFromJson(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future<ContactUsModel> contactApi() async {
    final response = await http.post(getUrl('contact'), body: {});
    // print(response.body);
    try {
      return contactUsModelFromJson(response.body);
    } catch (e) {
      print(e);
    }
  }
}

class AddressApis {
  Future<String> deleteAddress({String addressId}) async {
    var id = await userId();
    final response = await http.post(getUrl('deleteaddress'), body: {
      "user_id": id,
      "adrid": addressId,
    });
    // print(response.body);
    try {
      var data = addressFromJson(response.body);
      if (data.data.status == '200') {
        return data.data.message;
      } else
        toastFn(comment: data.data.message);
    } catch (e) {
      print(e);
      return 'error';
    }
  }

  Future<String> addAddress({
    String adrfirstName,
    String adrlastName,
    String adremail,
    String adrphon,
    String adrphon2,
    String adravenue,
    String adrarea,
    String adrstreet,
    String adrBlock,
    String adrhouse,
    String adrgovernarate,
  }) async {
    var id = await userId();
    final response = await http.post(getUrl('save_address'), body: {
      "user_id": id,
      "adrfirstName": adrfirstName,
      "adrlastName": adrlastName,
      "adremail": adremail,
      "adrphon": adrphon,
      "adrphon2": adrphon2,
      "adravenue": adravenue,
      "adrarea": adrarea,
      "adrstreet": adrstreet,
      "adrBlock": adrBlock,
      "adrhouse": adrhouse,
      "address_governarate": adrgovernarate,
    });

    try {
      return response.body;
    } catch (e) {
      print(e);
      return "Something Wrong";
    }
  }

  Future<String> updateAddress({
    String adrfirstName,
    String adrlastName,
    String adremail,
    String adrphon,
    String adrphon2,
    String adravenue,
    String adrarea,
    String adrstreet,
    String adrBlock,
    String adrhouse,
    String addressId,
    String adrgovernarate,
  }) async {
    var id = await userId();
    final response = await http.post(getUrl('edit_address'), body: {
      "user_id": id,
      "adrfirstName": adrfirstName,
      "adrlastName": adrlastName,
      "adremail": adremail,
      "adrphon": adrphon,
      "adrphon2": adrphon2,
      "adravenue": adravenue,
      "adrarea": adrarea,
      "adrstreet": adrstreet,
      "adrBlock": adrBlock,
      "adrhouse": adrhouse,
      "address_id": addressId,
      "address_governarate": adrgovernarate,
    });

    try {
      return response.body;
    } catch (e) {
      print(e);
      return "Something Wrong";
    }
  }

  Future<Address> showAddress({String user_id}) async {
    var id = await userId();
    final response = await http.post(getUrl('show_address'), body: {
      "user_id": id,
    });
    // print(response.body);
    try {
      return addressFromJson(response.body);
    } catch (e) {
      print(e);
      return Address();
    }
  }

  Future<GovernarateModel> getGovernarate() async {
    var id = await userId();
    final response = await http.post(getUrl('governarate'), body: {});
    // print(response.body);
    try {
      return governarateModelFromJson(response.body);
    } catch (e) {
      print(e);
      return GovernarateModel();
    }
  }

  Future<CitiesModel> getCities(String gover) async {
    var id = await userId();
    final response =
        await http.post(getUrl('city'), body: {"governarate_name": gover});
    // print(response.body);
    try {
      return citiesModelFromJson(response.body);
    } catch (e) {
      print(e);
      return CitiesModel();
    }
  }
}

Future<ProfileClass> profileAPi() async {
  var id = await userId();

  final response = await http.post(getUrl('profile'), body: {
    "user_id": id,
  });

  try {
    return profileClassFromJson(response.body);
  } catch (e) {
    print(e);
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
    "user_id": id,
    "newpassword": pass,
    "confirmpassword": cpass,
    "fname": fname,
    "lastname": lname,
    "email": email
  });
  // print(response.body);
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

Future<SingleProductClass> singleProductApi({String pid}) async {
  final response = await http.post(getUrl('single_product'), body: {
    // "product_id": "664",
    "product_id": pid,
  });
  print(singleProductClassFromJson(response.body));
  try {
    return singleProductClassFromJson(response.body);
  } catch (e) {
    print(e);
    return SingleProductClass();
  }
}

Future<SingleProductClass> singleProductLoginApi({String pid}) async {
  var id = await userId();
  final response = await http.post(getUrl('single_product'), body: {
    // "product_id": "664",
    "user_id": id,
    "product_id": pid,
  });
  // print(response.body);
  try {
    return singleProductClassFromJson(response.body);
  } catch (e) {
    print(e);
    return SingleProductClass();
  }
}

Future<OrderHistoryClass> orderHistoryApi() async {
  var id = await userId();
  final response = await http.post(getUrl('order_history'), body: {
    // "user_id": "130",
    "user_id": id,
    //change
  });
  // print(response.body);
  try {
    return orderHistoryClassFromJson(response.body);
  } catch (e) {
    print(e);
    return OrderHistoryClass();
  }
}

Future<OrderCheckClass> orderCheckApi({String coupon, String add_id}) async {
  var id = await userId();
  // print(id);
  // print(add_id);
  // print(coupon);
  final response = await http.post(getUrl('order_check'), body: {
    "user_id": id,
    "coupon": coupon,
    "address_id": add_id,
  });
  // print(response.body);
  try {
    return orderCheckClassFromJson(response.body);
  } catch (e) {
    print(e);
    return OrderCheckClass();
  }
}

Future<OrderConfirmClass> orderConfirmApi(
    {String coupon, String add_id}) async {
  var id = await userId();
  // print(id);
  // print(add_id);
  final response = await http.post(getUrl('order_confirm'), body: {
    "user_id": id,
    "coupon": coupon,
    "address_id": add_id,
  });
  // print(orderCheckClassFromJson(response.body));
  try {
    return orderConfirmClassFromJson(response.body);
  } catch (e) {
    print(e);
    return OrderConfirmClass();
  }
}
