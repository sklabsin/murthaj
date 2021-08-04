// To parse this JSON data, do
//
//     final singleProductClass = singleProductClassFromJson(jsonString);

import 'dart:convert';

SingleProductClass singleProductClassFromJson(String str) =>
    SingleProductClass.fromJson(json.decode(str));

String singleProductClassToJson(SingleProductClass data) =>
    json.encode(data.toJson());

class SingleProductClass {
  SingleProductClass({
    this.data,
  });

  Data data;

  factory SingleProductClass.fromJson(Map<String, dynamic> json) =>
      SingleProductClass(
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
  Response response;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        response: Response.fromJson(json["response"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response.toJson(),
        "message": message,
      };
}

class Response {
  Response({
    this.productId,
    this.productSellPrice,
    this.productName,
    this.productNameArab,
    this.productImage,
    this.productShortDesc,
    this.productQuantity,
    this.productSingleQuantity,
    this.productShortDescArab,
    this.brandId,
    this.brandName,
    this.brandNameArab,
    this.brandFooterprio,
    this.brandPic,
    this.brandDate,
    this.categoryId,
    this.categoryLabel,
    this.categoryLabelAr,
    this.categoryHomepic,
    this.categoryBannerpic,
    this.categoryPrio,
    this.categoryHomePrio,
    this.categoryDate,
    this.subcategoryId,
    this.subcategoryName,
    this.subcategoryNameAr,
    this.subcategoryCategory,
    this.subcategoryImage,
    this.subcategoryDate,
    this.orderField,
    this.cartStatus,
    this.cartId,
    this.wishlistStatus,
  });

  String productId;
  String productSellPrice;
  String productName;
  String productNameArab;
  String productImage;
  String productShortDesc;
  String productQuantity;
  String productSingleQuantity;
  String productShortDescArab;
  String brandId;
  String brandName;
  String brandNameArab;
  String brandFooterprio;
  String brandPic;
  DateTime brandDate;
  String categoryId;
  String categoryLabel;
  String categoryLabelAr;
  String categoryHomepic;
  String categoryBannerpic;
  String categoryPrio;
  String categoryHomePrio;
  DateTime categoryDate;
  String subcategoryId;
  String subcategoryName;
  String subcategoryNameAr;
  String subcategoryCategory;
  String subcategoryImage;
  DateTime subcategoryDate;
  dynamic orderField;
  String cartStatus;
  String cartId;
  String wishlistStatus;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        productId: json["product_id"],
        productSellPrice: json["product_sell_price"],
        productName: json["product_name"],
        productNameArab: json["product_name_arab"],
        productImage: json["product_image"],
        productShortDesc: json["product_short_desc"],
        productQuantity: json["product_quantity"],
        productSingleQuantity: json["product_single_quantity"],
        productShortDescArab: json["product_short_desc_arab"],
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        brandNameArab: json["brand_name_arab"],
        brandFooterprio: json["brand_footerprio"],
        brandPic: json["brand_pic"],
        brandDate: DateTime.parse(json["brand_date"]),
        categoryId: json["category_id"],
        categoryLabel: json["category_label"],
        categoryLabelAr: json["category_label_ar"],
        categoryHomepic: json["category_homepic"],
        categoryBannerpic: json["category_bannerpic"],
        categoryPrio: json["category_prio"],
        categoryHomePrio: json["category_home_prio"],
        categoryDate: DateTime.parse(json["category_date"]),
        subcategoryId: json["subcategory_id"],
        subcategoryName: json["subcategory_name"],
        subcategoryNameAr: json["subcategory_name_ar"],
        subcategoryCategory: json["subcategory_category"],
        subcategoryImage: json["subcategory_image"],
        subcategoryDate: DateTime.parse(json["subcategory_date"]),
        orderField: json["order_field"],
        cartStatus: json["cart_status"],
        cartId: json["cart_id"],
        wishlistStatus: json["wishlist_status"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_sell_price": productSellPrice,
        "product_name": productName,
        "product_name_arab": productNameArab,
        "product_image": productImage,
        "product_short_desc": productShortDesc,
        "product_quantity": productQuantity,
        "product_single_quantity": productSingleQuantity,
        "product_short_desc_arab": productShortDescArab,
        "brand_id": brandId,
        "brand_name": brandName,
        "brand_name_arab": brandNameArab,
        "brand_footerprio": brandFooterprio,
        "brand_pic": brandPic,
        "brand_date":
            "${brandDate.year.toString().padLeft(4, '0')}-${brandDate.month.toString().padLeft(2, '0')}-${brandDate.day.toString().padLeft(2, '0')}",
        "category_id": categoryId,
        "category_label": categoryLabel,
        "category_label_ar": categoryLabelAr,
        "category_homepic": categoryHomepic,
        "category_bannerpic": categoryBannerpic,
        "category_prio": categoryPrio,
        "category_home_prio": categoryHomePrio,
        "category_date":
            "${categoryDate.year.toString().padLeft(4, '0')}-${categoryDate.month.toString().padLeft(2, '0')}-${categoryDate.day.toString().padLeft(2, '0')}",
        "subcategory_id": subcategoryId,
        "subcategory_name": subcategoryName,
        "subcategory_name_ar": subcategoryNameAr,
        "subcategory_category": subcategoryCategory,
        "subcategory_image": subcategoryImage,
        "subcategory_date":
            "${subcategoryDate.year.toString().padLeft(4, '0')}-${subcategoryDate.month.toString().padLeft(2, '0')}-${subcategoryDate.day.toString().padLeft(2, '0')}",
        "order_field": orderField,
        "cart_status": cartStatus,
        "cart_id": cartId,
        "wishlist_status": wishlistStatus,
      };
}
