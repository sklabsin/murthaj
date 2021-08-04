// To parse this JSON data, do
//
//     final homeMainCategoryModel = homeMainCategoryModelFromJson(jsonString);

import 'dart:convert';

HomeMainCategoryModel homeMainCategoryModelFromJson(String str) =>
    HomeMainCategoryModel.fromJson(json.decode(str));

String homeMainCategoryModelToJson(HomeMainCategoryModel data) =>
    json.encode(data.toJson());

class HomeMainCategoryModel {
  HomeMainCategoryModel({
    this.data,
  });

  Data data;

  factory HomeMainCategoryModel.fromJson(Map<String, dynamic> json) =>
      HomeMainCategoryModel(
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
  List<Response> response;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.categoryId,
    this.categoryLabel,
    this.categoryLabelAr,
    this.categoryHomepic,
    this.categoryBannerpic,
    this.categoryPrio,
    this.categoryHomePrio,
    this.categoryDate,
  });

  String categoryId;
  String categoryLabel;
  String categoryLabelAr;
  String categoryHomepic;
  String categoryBannerpic;
  String categoryPrio;
  String categoryHomePrio;
  DateTime categoryDate;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        categoryId: json["category_id"],
        categoryLabel: json["category_label"],
        categoryLabelAr: json["category_label_ar"],
        categoryHomepic: json["category_homepic"],
        categoryBannerpic: json["category_bannerpic"],
        categoryPrio: json["category_prio"],
        categoryHomePrio: json["category_home_prio"],
        categoryDate: DateTime.parse(json["category_date"]),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_label": categoryLabel,
        "category_label_ar": categoryLabelAr,
        "category_homepic": categoryHomepic,
        "category_bannerpic": categoryBannerpic,
        "category_prio": categoryPrio,
        "category_home_prio": categoryHomePrio,
        "category_date":
            "${categoryDate.year.toString().padLeft(4, '0')}-${categoryDate.month.toString().padLeft(2, '0')}-${categoryDate.day.toString().padLeft(2, '0')}",
      };
}
