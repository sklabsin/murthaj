// To parse this JSON data, do
//
//     final mostPopularClass = mostPopularClassFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    this.data,
  });

  Data data;
  factory Address.fromJson(Map<String, dynamic> json) => Address(
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
  List<AddressResponse> response;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: json["status"] != '200'
            ? []
            : List<AddressResponse>.from(
                json["response"].map((x) => AddressResponse.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "message": message ?? '',
      };
}

class AddressResponse {
  AddressResponse(
      {this.address_id,
      this.address_userid,
      this.address_primery,
      this.address_title,
      this.address_fname,
      this.address_lname,
      this.address_governarate,
      this.address_city,
      this.address_block,
      this.address_street,
      this.address_avanue,
      this.address_hb,
      this.address_mail,
      this.address_mobile1,
      this.address_mobile2,
      this.address_name,
      this.address_date});

  String address_id;
  String address_userid;
  String address_primery;
  String address_title;
  String address_fname;
  String address_lname;
  String address_governarate;
  String address_city;
  String address_block;
  String address_street;
  String address_avanue;
  String address_hb;
  String address_mail;
  String address_mobile1;
  String address_mobile2;
  String address_date;
  String address_name;

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      AddressResponse(
        address_id: json["address_id"] ?? "",
        address_userid: json["address_userid"] ?? "",
        address_primery: json["address_primery"] ?? "",
        address_title: json["address_title"] ?? "",
        address_fname: json["address_fname"] ?? "",
        address_lname: json["address_lname"] ?? "",
        address_governarate: json["address_governarate"] ?? "",
        address_city: json["address_city"] ?? "",
        address_block: json["address_block"] ?? "",
        address_street: json["address_street"] ?? "",
        address_avanue: json["address_avanue"] ?? "",
        address_hb: json["address_hb"] ?? "",
        address_mail: json["address_mail"] ?? "",
        address_mobile1: json["address_mobile1"] ?? "",
        address_mobile2: json["address_mobile2"] ?? "",
        address_date: json["address_date"] ?? "",
        address_name: json["city_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "address_id": address_id,
        "address_userid": address_userid,
        "address_primery": address_primery,
        "address_title": address_title,
        "address_fname": address_fname,
        "address_lname": address_lname,
        "address_governarate": address_governarate,
        "address_city": address_city,
        "address_block": address_block,
        "address_street": address_street,
        "address_avanue": address_avanue,
        "address_hb": address_hb,
        "address_mail": address_mail,
        "address_mobile1": address_mobile1,
        "address_mobile2": address_mobile2,
        "address_date": address_date,
        "city_name": address_name,
      };
}
