// To parse this JSON data, do
//
//     final productListing = productListingFromJson(jsonString);

import 'dart:convert';

ProductListing productListingFromJson(String str) =>
    ProductListing.fromJson(json.decode(str));

String productListingToJson(ProductListing data) => json.encode(data.toJson());

class ProductListing {
  ProductListing({
    this.data,
  });

  Data data;

  factory ProductListing.fromJson(Map<String, dynamic> json) => ProductListing(
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

  int status;
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
    this.products,
  });

  List<String> products;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        products: List<String>.from(json["products "].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "products ": List<dynamic>.from(products.map((x) => x)),
      };
}
