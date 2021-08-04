// To parse this JSON data, do
//
//     final orderConfirmClass = orderConfirmClassFromJson(jsonString);

import 'dart:convert';

OrderConfirmClass orderConfirmClassFromJson(String str) =>
    OrderConfirmClass.fromJson(json.decode(str));

String orderConfirmClassToJson(OrderConfirmClass data) =>
    json.encode(data.toJson());

class OrderConfirmClass {
  OrderConfirmClass({
    this.data,
  });

  Data data;

  factory OrderConfirmClass.fromJson(Map<String, dynamic> json) =>
      OrderConfirmClass(
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
    this.order,
  });

  String order;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "order": order,
      };
}
