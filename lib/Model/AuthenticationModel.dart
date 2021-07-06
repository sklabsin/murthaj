// To parse this JSON data, do
//
//     final registrationClass = registrationClassFromJson(jsonString);

import 'dart:convert';

AuthenticationClass authenticationClassFromJson(String str) =>
    AuthenticationClass.fromJson(json.decode(str));

String authenticationClassToJson(AuthenticationClass data) =>
    json.encode(data.toJson());

class AuthenticationClass {
  AuthenticationClass({
    this.data,
  });

  Data? data;

  factory AuthenticationClass.fromJson(Map<String, dynamic> json) =>
      AuthenticationClass(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.status,
    this.response,
    this.message,
  });

  String? status;
  Response? response;
  String? message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: json["status"] != "200"
            ? Response()
            : Response.fromJson(json["response"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? '',
        "response": response!.toJson(),
        "message": message ?? '',
      };
}

class Response {
  Response({
    this.username,
    this.usermail,
    this.userid,
  });

  String? username;
  String? usermail;
  String? userid;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        username: json["username"] ?? "",
        usermail: json["usermail"] ?? "",
        userid: json["userid"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "usermail": usermail,
        "userid": userid,
      };
}
