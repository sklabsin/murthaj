// To parse this JSON data, do
//
//     final orderCheckClass = orderCheckClassFromJson(jsonString);

import 'dart:convert';

OrderCheckClass orderCheckClassFromJson(String str) =>
    OrderCheckClass.fromJson(json.decode(str));

String orderCheckClassToJson(OrderCheckClass data) =>
    json.encode(data.toJson());

class OrderCheckClass {
  OrderCheckClass({
    this.data,
  });

  Data data;

  factory OrderCheckClass.fromJson(Map<String, dynamic> json) =>
      OrderCheckClass(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.status,
    this.response,
    this.message,
  });

  String status;
  Response response;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: Response.fromJson(json["response"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response.toJson(),
        "message": message,
      };
}

class Response {
  Response({
    this.comments,
    this.discnote,
    this.cartamount,
    this.discount,
    this.coupon,
    this.deliveryCharge,
    this.areaMinCart,
  });

  String comments;
  String discnote;
  String cartamount;
  int discount;
  String coupon;
  int deliveryCharge;
  int areaMinCart;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        comments: json["comments"],
        discnote: json["discnote"],
        cartamount: json["cartamount"],
        discount: json["discount"],
        coupon: json["coupon"],
        deliveryCharge: json["delivery_charge"],
        areaMinCart: json["area_min_cart"],
      );

  Map<String, dynamic> toJson() => {
        "comments": comments,
        "discnote": discnote,
        "cartamount": cartamount,
        "discount": discount,
        "coupon": coupon,
        "delivery_charge": deliveryCharge,
        "area_min_cart": areaMinCart,
      };
}
