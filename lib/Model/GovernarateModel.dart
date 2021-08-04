// To parse this JSON data, do
//
//     final governarateModel = governarateModelFromJson(jsonString);

import 'dart:convert';

GovernarateModel governarateModelFromJson(String str) =>
    GovernarateModel.fromJson(json.decode(str));

String governarateModelToJson(GovernarateModel data) =>
    json.encode(data.toJson());

class GovernarateModel {
  GovernarateModel({
    this.data,
  });

  Data data;

  factory GovernarateModel.fromJson(Map<String, dynamic> json) =>
      GovernarateModel(
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
  List<GovernarateResponse> response;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: List<GovernarateResponse>.from(
            json["response"].map((x) => GovernarateResponse.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "message": message,
      };
}

class GovernarateResponse {
  GovernarateResponse({
    this.governorate,
    this.governorateAr,
  });

  String governorate;
  String governorateAr;

  factory GovernarateResponse.fromJson(Map<String, dynamic> json) =>
      GovernarateResponse(
        governorate: json["governorate"],
        governorateAr: json["governorate_ar"],
      );

  Map<String, dynamic> toJson() => {
        "governorate": governorate,
        "governorate_ar": governorateAr,
      };
}
