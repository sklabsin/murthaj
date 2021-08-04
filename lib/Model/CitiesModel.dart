// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

import 'dart:convert';

CitiesModel citiesModelFromJson(String str) =>
    CitiesModel.fromJson(json.decode(str));

String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());

class CitiesModel {
  CitiesModel({
    this.data,
  });

  Data data;

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
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
  List<CityResponse> response;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: List<CityResponse>.from(
            json["response"].map((x) => CityResponse.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "message": message,
      };
}

class CityResponse {
  CityResponse({
    this.cityId,
    this.cityName,
    this.cityNameAr,
  });

  String cityId;
  String cityName;
  String cityNameAr;

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        cityId: json["city_id"],
        cityName: json["city_name"],
        cityNameAr: json["city_name_ar"],
      );

  Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "city_name": cityName,
        "city_name_ar": cityNameAr,
      };
}
