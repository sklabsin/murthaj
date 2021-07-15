// To parse this JSON data, do
//
//     final subCategoryClass = subCategoryClassFromJson(jsonString);

import 'dart:convert';

SubCategoryClass subCategoryClassFromJson(String str) =>
    SubCategoryClass.fromJson(json.decode(str));

String subCategoryClassToJson(SubCategoryClass data) =>
    json.encode(data.toJson());

class SubCategoryClass {
  SubCategoryClass({
    this.data,
  });

  Data data;

  factory SubCategoryClass.fromJson(Map<String, dynamic> json) =>
      SubCategoryClass(
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
            json[" response "].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        " response ": List<dynamic>.from(response.map((x) => x.toJson())),
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
    this.subcat,
  });

  String categoryId;
  String categoryLabel;
  String categoryLabelAr;
  String categoryHomepic;
  String categoryBannerpic;
  String categoryPrio;
  String categoryHomePrio;
  DateTime categoryDate;
  List<Subcat> subcat;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        categoryId: json["category_id"],
        categoryLabel: json["category_label"],
        categoryLabelAr: json["category_label_ar"],
        categoryHomepic: json["category_homepic"],
        categoryBannerpic: json["category_bannerpic"],
        categoryPrio: json["category_prio"],
        categoryHomePrio: json["category_home_prio"],
        categoryDate: DateTime.parse(json["category_date"]),
        subcat:
            List<Subcat>.from(json["subcat"].map((x) => Subcat.fromJson(x))),
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
        "subcat": List<dynamic>.from(subcat.map((x) => x.toJson())),
      };
}

class Subcat {
  Subcat({
    this.subcategoryId,
    this.subcategoryName,
    this.subcategoryNameAr,
    this.subcategoryCategory,
    this.subcategoryImage,
    this.subcategoryDate,
    this.orderField,
    this.prod,
  });

  String subcategoryId;
  String subcategoryName;
  String subcategoryNameAr;
  String subcategoryCategory;
  String subcategoryImage;
  DateTime subcategoryDate;
  String orderField;
  List<Prod> prod;

  factory Subcat.fromJson(Map<String, dynamic> json) => Subcat(
        subcategoryId: json["subcategory_id"],
        subcategoryName: json["subcategory_name"],
        subcategoryNameAr: json["subcategory_name_ar"],
        subcategoryCategory: json["subcategory_category"],
        subcategoryImage: json["subcategory_image"],
        subcategoryDate: DateTime.parse(json["subcategory_date"]),
        orderField: json["order_field"] == null ? null : json["order_field"],
        prod: List<Prod>.from(json["prod"].map((x) => Prod.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subcategory_id": subcategoryId,
        "subcategory_name": subcategoryName,
        "subcategory_name_ar": subcategoryNameAr,
        "subcategory_category": subcategoryCategory,
        "subcategory_image": subcategoryImage,
        "subcategory_date":
            "${subcategoryDate.year.toString().padLeft(4, '0')}-${subcategoryDate.month.toString().padLeft(2, '0')}-${subcategoryDate.day.toString().padLeft(2, '0')}",
        "order_field": orderField == null ? null : orderField,
        "prod": List<dynamic>.from(prod.map((x) => x.toJson())),
      };
}

class Prod {
  Prod({
    this.productId,
    this.productSellPrice,
    this.productName,
    this.productNameArab,
    this.productImage,
    this.wishlist_status,
  });

  String productId;
  String productSellPrice;
  String productName;
  String productNameArab;
  String productImage;
  String wishlist_status;

  factory Prod.fromJson(Map<String, dynamic> json) => Prod(
        productId: json["product_id"],
        productSellPrice: json["product_sell_price"],
        productName: json["product_name"],
        productNameArab: json["product_name_arab"],
        productImage: json["product_image"],
        wishlist_status: json["wishlist_status"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_sell_price": productSellPrice,
        "product_name": productName,
        "product_name_arab": productNameArab,
        "product_image": productImage,
        "wishlist_status": wishlist_status,
      };
}
