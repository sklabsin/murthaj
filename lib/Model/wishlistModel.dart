// To parse this JSON data, do
//
//     final wishlistClass = wishlistClassFromJson(jsonString);

import 'dart:convert';

WishlistClass wishlistClassFromJson(String str) =>
    WishlistClass.fromJson(json.decode(str));

String wishlistClassToJson(WishlistClass data) => json.encode(data.toJson());

class WishlistClass {
  WishlistClass({
    this.data,
  });

  Data data;

  factory WishlistClass.fromJson(Map<String, dynamic> json) => WishlistClass(
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
        response: json["status"] != '200'
            ? Response()
            : Response.fromJson(json["response"]),
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
    this.wishlistId,
  });

  String wishlistId;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        wishlistId: json["wishlist_id"],
      );

  Map<String, dynamic> toJson() => {
        "wishlist_id": wishlistId,
      };
}
