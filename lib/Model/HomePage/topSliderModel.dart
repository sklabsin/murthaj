// To parse this JSON data, do
//
//     final topSliderClass = topSliderClassFromJson(jsonString);

import 'dart:convert';

TopSliderClass topSliderClassFromJson(String str) =>
    TopSliderClass.fromJson(json.decode(str));

String topSliderClassToJson(TopSliderClass data) => json.encode(data.toJson());

class TopSliderClass {
  TopSliderClass({
    this.data,
  });

  Data data;

  factory TopSliderClass.fromJson(Map<String, dynamic> json) => TopSliderClass(
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
  List<SliderResponse> response;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: List<SliderResponse>.from(
            json["response"].map((x) => SliderResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class SliderResponse {
  SliderResponse({
    this.bannerId,
    this.bannerTitle,
    this.bannerShortdesc,
    this.bannerTitlear,
    this.bannerShortdescar,
    this.bannerPrio,
    this.bannerUrl,
    this.bannerImage,
    this.bannerDate,
  });

  String bannerId;
  String bannerTitle;
  String bannerShortdesc;
  String bannerTitlear;
  String bannerShortdescar;
  String bannerPrio;
  String bannerUrl;
  String bannerImage;
  DateTime bannerDate;

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
        bannerId: json["banner_id"],
        bannerTitle: json["banner_title"],
        bannerShortdesc: json["banner_shortdesc"],
        bannerTitlear: json["banner_titlear"],
        bannerShortdescar: json["banner_shortdescar"],
        bannerPrio: json["banner_prio"],
        bannerUrl: json["banner_url"],
        bannerImage: json["banner_image"],
        bannerDate: DateTime.parse(json["banner_date"]),
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner_title": bannerTitle,
        "banner_shortdesc": bannerShortdesc,
        "banner_titlear": bannerTitlear,
        "banner_shortdescar": bannerShortdescar,
        "banner_prio": bannerPrio,
        "banner_url": bannerUrl,
        "banner_image": bannerImage,
        "banner_date":
            "${bannerDate?.year.toString().padLeft(4, '0')}-${bannerDate?.month.toString().padLeft(2, '0')}-${bannerDate?.day.toString().padLeft(2, '0')}",
      };
}
