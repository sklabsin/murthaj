// To parse this JSON data, do
//
//     final mostPopularClass = mostPopularClassFromJson(jsonString);

import 'dart:convert';

MostPopularClass mostPopularClassFromJson(String str) =>
    MostPopularClass.fromJson(json.decode(str));

String mostPopularClassToJson(MostPopularClass data) =>
    json.encode(data.toJson());

class MostPopularClass {
  MostPopularClass({
    this.data,
  });

  Data data;

  factory MostPopularClass.fromJson(Map<String, dynamic> json) =>
      MostPopularClass(
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
  List<CardResponse> response;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: List<CardResponse>.from(
            json["response"].map((x) => CardResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class CardResponse {
  CardResponse(
      {this.productId,
      this.productSellPrice,
      this.productName,
      this.productNameArab,
      this.productImage,
      this.wishliststatus});

  String productId;
  String productSellPrice;
  String productName;
  String productNameArab;
  String productImage;
  String wishliststatus;

  factory CardResponse.fromJson(Map<String, dynamic> json) => CardResponse(
        productId: json["product_id"],
        productSellPrice: json["product_sell_price"],
        productName: json["product_name"],
        productNameArab: json["product_name_arab"],
        productImage: json["product_image"],
        wishliststatus: json["wishlist_status"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_sell_price": productSellPrice,
        "product_name": productName,
        "product_name_arab": productNameArab,
        "product_image": productImage,
        "wishlist_status": wishliststatus,
      };
}
