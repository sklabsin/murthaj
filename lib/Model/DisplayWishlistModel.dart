// To parse this JSON data, do
//
//     final wishlistDisplayClass = wishlistDisplayClassFromJson(jsonString);

import 'dart:convert';

WishlistDisplayClass wishlistDisplayClassFromJson(String str) =>
    WishlistDisplayClass.fromJson(json.decode(str));

String wishlistDisplayClassToJson(WishlistDisplayClass data) =>
    json.encode(data.toJson());

class WishlistDisplayClass {
  WishlistDisplayClass({
    this.data,
  });

  Data data;

  factory WishlistDisplayClass.fromJson(Map<String, dynamic> json) =>
      WishlistDisplayClass(
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
  List<WishListResponse> response;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: List<WishListResponse>.from(
            json["response"].map((x) => WishListResponse.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "message": message,
      };
}

class WishListResponse {
  WishListResponse({
    this.wishlistId,
    this.productId,
    this.productSellPrice,
    this.productName,
    this.productNameArab,
    this.productImage,
    this.cartStatus,
    this.cartId,
  });

  String wishlistId;
  String productId;
  String productSellPrice;
  String productName;
  String productNameArab;
  String productImage;
  String cartStatus;
  String cartId;

  factory WishListResponse.fromJson(Map<String, dynamic> json) =>
      WishListResponse(
        wishlistId: json["wishlist_id"],
        productId: json["product_id"],
        productSellPrice: json["product_sell_price"],
        productName: json["product_name"],
        productNameArab: json["product_name_arab"],
        productImage: json["product_image"],
        cartStatus: json["cart_status"],
        cartId: json["cart_id"],
      );

  Map<String, dynamic> toJson() => {
        "wishlist_id": wishlistId,
        "product_id": productId,
        "product_sell_price": productSellPrice,
        "product_name": productName,
        "product_name_arab": productNameArab,
        "product_image": productImage,
        "cart_status": cartStatus,
        "cart_id": cartId,
      };
}
