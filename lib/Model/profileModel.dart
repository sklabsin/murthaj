// To parse this JSON data, do
//
//     final profileClass = profileClassFromJson(jsonString);

import 'dart:convert';

ProfileClass profileClassFromJson(String str) =>
    ProfileClass.fromJson(json.decode(str));

String profileClassToJson(ProfileClass data) => json.encode(data.toJson());

class ProfileClass {
  ProfileClass({
    this.data,
  });

  Data data;

  factory ProfileClass.fromJson(Map<String, dynamic> json) => ProfileClass(
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
  ProfileResponse response;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: ProfileResponse.fromJson(json["response"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response.toJson(),
        "message": message,
      };
}

class ProfileResponse {
  ProfileResponse({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
  });

  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        firstName: json["FirstName"],
        lastName: json["lastName"],
        email: json["Email"],
        password: json["Password"],
        confirmPassword: json["Confirm_Password"],
      );

  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "lastName": lastName,
        "Email": email,
        "Password": password,
        "Confirm_Password": confirmPassword,
      };
}
