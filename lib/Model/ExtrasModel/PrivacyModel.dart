// To parse this JSON data, do
//
//     final privacyModel = privacyModelFromJson(jsonString);

import 'dart:convert';

PrivacyModel privacyModelFromJson(String str) =>
    PrivacyModel.fromJson(json.decode(str));

String privacyModelToJson(PrivacyModel data) => json.encode(data.toJson());

class PrivacyModel {
  PrivacyModel({
    this.data,
  });

  Data data;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
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
    this.termsId,
    this.termsContent,
    this.termsContentArab,
    this.termsBanner,
    this.termsDate,
  });

  String termsId;
  String termsContent;
  String termsContentArab;
  String termsBanner;
  DateTime termsDate;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        termsId: json["terms_id"],
        termsContent: json["terms_content"],
        termsContentArab: json["terms_content_arab"],
        termsBanner: json["terms_banner"],
        termsDate: DateTime.parse(json["terms_date"]),
      );

  Map<String, dynamic> toJson() => {
        "terms_id": termsId,
        "terms_content": termsContent,
        "terms_content_arab": termsContentArab,
        "terms_banner": termsBanner,
        "terms_date":
            "${termsDate.year.toString().padLeft(4, '0')}-${termsDate.month.toString().padLeft(2, '0')}-${termsDate.day.toString().padLeft(2, '0')}",
      };
}
