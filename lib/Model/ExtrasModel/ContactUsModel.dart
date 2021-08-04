// To parse this JSON data, do
//
//     final contactUsModel = contactUsModelFromJson(jsonString);

import 'dart:convert';

ContactUsModel contactUsModelFromJson(String str) =>
    ContactUsModel.fromJson(json.decode(str));

String contactUsModelToJson(ContactUsModel data) => json.encode(data.toJson());

class ContactUsModel {
  ContactUsModel({
    this.data,
  });

  Data data;

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
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
  List<Response> response;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "message": message,
      };
}

class Response {
  Response({
    this.contactId,
    this.contactAddress,
    this.contactPhon,
    this.contactWhatsapp,
    this.contactMail,
    this.contactCmail,
    this.contactDate,
    this.contactAddressAr,
    this.contactBanner,
  });

  String contactId;
  String contactAddress;
  String contactPhon;
  String contactWhatsapp;
  String contactMail;
  String contactCmail;
  DateTime contactDate;
  String contactAddressAr;
  String contactBanner;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        contactId: json["contact_id"],
        contactAddress: json["contact_address"],
        contactPhon: json["contact_phon"],
        contactWhatsapp: json["contact_whatsapp"],
        contactMail: json["contact_mail"],
        contactCmail: json["contact_cmail"],
        contactDate: DateTime.parse(json["contact_date"]),
        contactAddressAr: json["contact_address_ar"],
        contactBanner: json["contact_banner"],
      );

  Map<String, dynamic> toJson() => {
        "contact_id": contactId,
        "contact_address": contactAddress,
        "contact_phon": contactPhon,
        "contact_whatsapp": contactWhatsapp,
        "contact_mail": contactMail,
        "contact_cmail": contactCmail,
        "contact_date":
            "${contactDate.year.toString().padLeft(4, '0')}-${contactDate.month.toString().padLeft(2, '0')}-${contactDate.day.toString().padLeft(2, '0')}",
        "contact_address_ar": contactAddressAr,
        "contact_banner": contactBanner,
      };
}
