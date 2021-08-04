// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.data,
  });

  Data data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
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
  });

  String status;
  String response;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
      };
}
