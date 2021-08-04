// To parse this JSON data, do
//
//     final cartDisplayClass = cartDisplayClassFromJson(jsonString);

import 'dart:convert';

CartDisplayClass cartDisplayClassFromJson(String str) =>
    CartDisplayClass.fromJson(json.decode(str));

String cartDisplayClassToJson(CartDisplayClass data) =>
    json.encode(data.toJson());

class CartDisplayClass {
  CartDisplayClass({
    this.data,
  });

  Data data;

  factory CartDisplayClass.fromJson(Map<String, dynamic> json) =>
      CartDisplayClass(
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
    this.grandTotal,
  });

  String status;
  List<CartResponse> response;
  String grandTotal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: json["status"] != '200'
            ? []
            : List<CartResponse>.from(
                json["response"].map((x) => CartResponse.fromJson(x))),
        grandTotal: json["status"] != '200' ? '' : json["Grand total"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "Grand total": grandTotal,
      };
}

class CartResponse {
  CartResponse({
    this.cartId,
    this.cartUserId,
    this.cartQuantity,
    this.cartStatus,
    this.productId,
    this.productSellPrice,
    this.productName,
    this.productNameArab,
    this.productImage,
    this.fixed,
    this.tableRate,
    this.totalPrice,
  });

  String cartId;
  String cartUserId;
  String cartQuantity;
  String cartStatus;
  String productId;
  String productSellPrice;
  String productName;
  String productNameArab;
  String productImage;
  String fixed;
  String tableRate;
  String totalPrice;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        cartId: json["cart_id"],
        cartUserId: json["cart_user_id"],
        cartQuantity: json["cart_quantity"],
        cartStatus: json["cart_status"],
        productId: json["product_id"],
        productSellPrice: json["product_sell_price"],
        productName: json["product_name"],
        productNameArab: json["product_name_arab"],
        productImage: json["product_image"],
        fixed: json["fixed"],
        tableRate: json["table_rate"],
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "cart_user_id": cartUserId,
        "cart_quantity": cartQuantity,
        "cart_status": cartStatus,
        "product_id": productId,
        "product_sell_price": productSellPrice,
        "product_name": productName,
        "product_name_arab": productNameArab,
        "product_image": productImage,
        "fixed": fixed,
        "table_rate": tableRate,
        "total_price": totalPrice,
      };
}
