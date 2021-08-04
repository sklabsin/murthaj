// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromJson(jsonString);

import 'dart:convert';

AboutModel aboutModelFromJson(String str) =>
    AboutModel.fromJson(json.decode(str));

String aboutModelToJson(AboutModel data) => json.encode(data.toJson());

class AboutModel {
  AboutModel({
    this.data,
  });

  Data data;

  factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
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
    this.aboutId,
    this.aboutTitle1,
    this.aboutContent1,
    this.aboutTitleArab,
    this.aboutContentArab,
    this.aboutBannerImage,
    this.aboutContentImage,
    this.aboutDate,
  });

  String aboutId;
  String aboutTitle1;
  String aboutContent1;
  String aboutTitleArab;
  String aboutContentArab;
  String aboutBannerImage;
  String aboutContentImage;
  DateTime aboutDate;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        aboutId: json["about_id"],
        aboutTitle1: json["about_title1"],
        aboutContent1: json["about_content1"],
        aboutTitleArab: json["about_title_arab"],
        aboutContentArab: json["about_content_arab"],
        aboutBannerImage: json["about_banner_image"],
        aboutContentImage: json["about_content_image"],
        aboutDate: DateTime.parse(json["about_date"]),
      );

  Map<String, dynamic> toJson() => {
        "about_id": aboutId,
        "about_title1": aboutTitle1,
        "about_content1": aboutContent1,
        "about_title_arab": aboutTitleArab,
        "about_content_arab": aboutContentArab,
        "about_banner_image": aboutBannerImage,
        "about_content_image": aboutContentImage,
        "about_date":
            "${aboutDate.year.toString().padLeft(4, '0')}-${aboutDate.month.toString().padLeft(2, '0')}-${aboutDate.day.toString().padLeft(2, '0')}",
      };
}
