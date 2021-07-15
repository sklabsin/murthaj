// To parse this JSON data, do
//
//     final bottomSliderClass = bottomSliderClassFromJson(jsonString);

import 'dart:convert';

BottomSliderClass bottomSliderClassFromJson(String str) =>
    BottomSliderClass.fromJson(json.decode(str));

String bottomSliderClassToJson(BottomSliderClass data) =>
    json.encode(data.toJson());

class BottomSliderClass {
  BottomSliderClass({
    this.data,
  });

  Data data;

  factory BottomSliderClass.fromJson(Map<String, dynamic> json) =>
      BottomSliderClass(
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
  });

  String status;
  List<BottomSliderResponse> response;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: List<BottomSliderResponse>.from(
            json["response"].map((x) => BottomSliderResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class BottomSliderResponse {
  BottomSliderResponse({
    this.middlebannerId,
    this.middlebannerTitle,
    this.middlebannerTitleAr,
    this.middlebannerOfferTitle,
    this.middlebannerOfferTitleAr,
    this.middlebannerOfferDigit,
    this.middlebannerImage,
    this.middlebannerDate,
  });

  String middlebannerId;
  String middlebannerTitle;
  String middlebannerTitleAr;
  String middlebannerOfferTitle;
  String middlebannerOfferTitleAr;
  String middlebannerOfferDigit;
  String middlebannerImage;
  DateTime middlebannerDate;

  factory BottomSliderResponse.fromJson(Map<String, dynamic> json) =>
      BottomSliderResponse(
        middlebannerId: json["middlebanner_id"],
        middlebannerTitle: json["middlebanner_title"],
        middlebannerTitleAr: json["middlebanner_title_ar"],
        middlebannerOfferTitle: json["middlebanner_offer_title"],
        middlebannerOfferTitleAr: json["middlebanner_offer_title_ar"],
        middlebannerOfferDigit: json["middlebanner_offer_digit"],
        middlebannerImage: json["middlebanner_image"],
        middlebannerDate: DateTime.parse(json["middlebanner_date"]),
      );

  Map<String, dynamic> toJson() => {
        "middlebanner_id": middlebannerId,
        "middlebanner_title": middlebannerTitle,
        "middlebanner_title_ar": middlebannerTitleAr,
        "middlebanner_offer_title": middlebannerOfferTitle,
        "middlebanner_offer_title_ar": middlebannerOfferTitleAr,
        "middlebanner_offer_digit": middlebannerOfferDigit,
        "middlebanner_image": middlebannerImage,
        "middlebanner_date":
            "${middlebannerDate.year.toString().padLeft(4, '0')}-${middlebannerDate.month.toString().padLeft(2, '0')}-${middlebannerDate.day.toString().padLeft(2, '0')}",
      };
}
