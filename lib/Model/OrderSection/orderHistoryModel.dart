// To parse this JSON data, do
//
//     final orderHistoryClass = orderHistoryClassFromJson(jsonString);

import 'dart:convert';

OrderHistoryClass orderHistoryClassFromJson(String str) =>
    OrderHistoryClass.fromJson(json.decode(str));

String orderHistoryClassToJson(OrderHistoryClass data) =>
    json.encode(data.toJson());

class OrderHistoryClass {
  OrderHistoryClass({
    this.data,
  });

  Data data;

  factory OrderHistoryClass.fromJson(Map<String, dynamic> json) =>
      OrderHistoryClass(
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
    this.ordersId,
    this.ordersUniqId,
    this.ordersUserId,
    this.ordersAdrsId,
    this.ordersPaymode,
    this.ordersTotalAmount,
    this.ordersTotalOfferAmount,
    this.ordersPromocode,
    this.ordersTotalQty,
    this.ordersDelcharge,
    this.ordersSameDelcharge,
    this.ordersInvoice,
    this.ordersStatus,
    this.ordersCancelStatus,
    this.ordersDate,
    this.ordersTime,
    this.deliveryCharge,
    this.orderItem,
  });

  String ordersId;
  String ordersUniqId;
  String ordersUserId;
  String ordersAdrsId;
  String ordersPaymode;
  String ordersTotalAmount;
  String ordersTotalOfferAmount;
  dynamic ordersPromocode;
  String ordersTotalQty;
  String ordersDelcharge;
  String ordersSameDelcharge;
  String ordersInvoice;
  String ordersStatus;
  String ordersCancelStatus;
  DateTime ordersDate;
  String ordersTime;
  String deliveryCharge;
  List<OrderItems> orderItem;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        ordersId: json["orders_id"],
        ordersUniqId: json["orders_uniq_id"],
        ordersUserId: json["orders_user_id"],
        ordersAdrsId: json["orders_adrs_id"],
        ordersPaymode: json["orders_paymode"],
        ordersTotalAmount: json["orders_total_amount"],
        ordersTotalOfferAmount: json["orders_total_offer_amount"],
        ordersPromocode: json["orders_promocode"],
        ordersTotalQty: json["orders_total_qty"],
        ordersDelcharge: json["orders_delcharge"],
        ordersSameDelcharge: json["orders_same_delcharge"],
        ordersInvoice: json["orders_invoice"],
        ordersStatus: json["orders_status"],
        ordersCancelStatus: json["orders_cancel_status"],
        ordersDate: DateTime.parse(json["orders_date"]),
        ordersTime: json["orders_time"],
        deliveryCharge: json["delivery_charge"],
        orderItem: List<OrderItems>.from(
            json["order_item"].map((x) => OrderItems.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders_id": ordersId,
        "orders_uniq_id": ordersUniqId,
        "orders_user_id": ordersUserId,
        "orders_adrs_id": ordersAdrsId,
        "orders_paymode": ordersPaymode,
        "orders_total_amount": ordersTotalAmount,
        "orders_total_offer_amount": ordersTotalOfferAmount,
        "orders_promocode": ordersPromocode,
        "orders_total_qty": ordersTotalQty,
        "orders_delcharge": ordersDelcharge,
        "orders_same_delcharge": ordersSameDelcharge,
        "orders_invoice": ordersInvoice,
        "orders_status": ordersStatus,
        "orders_cancel_status": ordersCancelStatus,
        "orders_date":
            "${ordersDate.year.toString().padLeft(4, '0')}-${ordersDate.month.toString().padLeft(2, '0')}-${ordersDate.day.toString().padLeft(2, '0')}",
        "orders_time": ordersTime,
        "delivery_charge": deliveryCharge,
        "order_item": List<dynamic>.from(orderItem.map((x) => x.toJson())),
      };
}

class OrderItems {
  OrderItems({
    this.dcId,
    this.dcCartId,
    this.dcUserId,
    this.dcProdId,
    this.dcOrderId,
    this.dcAgentId,
    this.dcAddressId,
    this.dcProdName,
    this.dcProdDesc,
    this.dcProdMeasure,
    this.dcProdQuantity,
    this.dcProdImage,
    this.dcProdSize,
    this.dcProdAge,
    this.dcProdColor,
    this.dcProdCommoffer,
    this.dcProdTax,
    this.dcProdActualcommission,
    this.dcProdActualstoreprice,
    this.dcTime,
    this.dcDate,
    this.dcShippedDate,
    this.dcShippedTime,
    this.dcDeliveryDate,
    this.dcDeliveryTime,
    this.dcStatus,
    this.orderStatus,
    this.dcCancelOrder,
    this.dcDeliveryDistance,
    this.dcDeliveryboyCharge,
    this.dcDeliveryownerCharge,
    this.dcPaymentMode,
    this.deliveryCharge,
    this.dcProdGiftstat,
    this.dcProdGiftdate,
    this.dcProdGifttime,
    this.dcProdGiftmsg,
    this.dcProdGiftamount,
    this.dcProdBundlestat,
    this.dcProdBndleOfferid,
    this.dcProdBndleProdids,
    this.dcProdInstallFee,
    this.dcProdMrp,
  });

  String dcId;
  String dcCartId;
  String dcUserId;
  String dcProdId;
  String dcOrderId;
  String dcAgentId;
  String dcAddressId;
  String dcProdName;
  String dcProdDesc;
  String dcProdMeasure;
  String dcProdQuantity;
  String dcProdImage;
  String dcProdSize;
  dynamic dcProdAge;
  String dcProdColor;
  String dcProdCommoffer;
  String dcProdTax;
  String dcProdActualcommission;
  String dcProdActualstoreprice;
  String dcTime;
  DateTime dcDate;
  String dcShippedDate;
  String dcShippedTime;
  String dcDeliveryDate;
  String dcDeliveryTime;
  String dcStatus;
  String orderStatus;
  String dcCancelOrder;
  String dcDeliveryDistance;
  String dcDeliveryboyCharge;
  String dcDeliveryownerCharge;
  String dcPaymentMode;
  String deliveryCharge;
  String dcProdGiftstat;
  String dcProdGiftdate;
  String dcProdGifttime;
  String dcProdGiftmsg;
  String dcProdGiftamount;
  String dcProdBundlestat;
  String dcProdBndleOfferid;
  String dcProdBndleProdids;
  String dcProdInstallFee;
  String dcProdMrp;

  factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
        dcId: json["dc_id"],
        dcCartId: json["dc_cart_id"],
        dcUserId: json["dc_user_id"],
        dcProdId: json["dc_prod_id"],
        dcOrderId: json["dc_order_id"],
        dcAgentId: json["dc_agent_id"],
        dcAddressId: json["dc_address_id"],
        dcProdName: json["dc_prod_name"],
        dcProdDesc: json["dc_prod_desc"],
        dcProdMeasure: json["dc_prod_measure"],
        dcProdQuantity: json["dc_prod_quantity"],
        dcProdImage: json["dc_prod_image"],
        dcProdSize: json["dc_prod_size"],
        dcProdAge: json["dc_prod_age"],
        dcProdColor: json["dc_prod_color"],
        dcProdCommoffer: json["dc_prod_commoffer"],
        dcProdTax: json["dc_prod_tax"],
        dcProdActualcommission: json["dc_prod_actualcommission"],
        dcProdActualstoreprice: json["dc_prod_actualstoreprice"],
        dcTime: json["dc_time"],
        dcDate: DateTime.parse(json["dc_date"]),
        dcShippedDate: json["dc_shipped_date"],
        dcShippedTime: json["dc_shipped_time"],
        dcDeliveryDate: json["dc_delivery_date"],
        dcDeliveryTime: json["dc_delivery_time"],
        dcStatus: json["dc_status"],
        orderStatus: json["order_status"],
        dcCancelOrder: json["dc_cancel_order"],
        dcDeliveryDistance: json["dc_delivery_distance"],
        dcDeliveryboyCharge: json["dc_deliveryboy_charge"],
        dcDeliveryownerCharge: json["dc_deliveryowner_charge"],
        dcPaymentMode: json["dc_payment_mode"],
        deliveryCharge: json["delivery_charge"],
        dcProdGiftstat: json["dc_prod_giftstat"],
        dcProdGiftdate: json["dc_prod_giftdate"],
        dcProdGifttime: json["dc_prod_gifttime"],
        dcProdGiftmsg: json["dc_prod_giftmsg"],
        dcProdGiftamount: json["dc_prod_giftamount"],
        dcProdBundlestat: json["dc_prod_bundlestat"],
        dcProdBndleOfferid: json["dc_prod_bndle_offerid"],
        dcProdBndleProdids: json["dc_prod_bndle_prodids"],
        dcProdInstallFee: json["dc_prod_install_fee"],
        dcProdMrp: json["dc_prod_mrp"],
      );

  Map<String, dynamic> toJson() => {
        "dc_id": dcId,
        "dc_cart_id": dcCartId,
        "dc_user_id": dcUserId,
        "dc_prod_id": dcProdId,
        "dc_order_id": dcOrderId,
        "dc_agent_id": dcAgentId,
        "dc_address_id": dcAddressId,
        "dc_prod_name": dcProdName,
        "dc_prod_desc": dcProdDesc,
        "dc_prod_measure": dcProdMeasure,
        "dc_prod_quantity": dcProdQuantity,
        "dc_prod_image": dcProdImage,
        "dc_prod_size": dcProdSize,
        "dc_prod_age": dcProdAge,
        "dc_prod_color": dcProdColor,
        "dc_prod_commoffer": dcProdCommoffer,
        "dc_prod_tax": dcProdTax,
        "dc_prod_actualcommission": dcProdActualcommission,
        "dc_prod_actualstoreprice": dcProdActualstoreprice,
        "dc_time": dcTime,
        "dc_date":
            "${dcDate.year.toString().padLeft(4, '0')}-${dcDate.month.toString().padLeft(2, '0')}-${dcDate.day.toString().padLeft(2, '0')}",
        "dc_shipped_date": dcShippedDate,
        "dc_shipped_time": dcShippedTime,
        "dc_delivery_date": dcDeliveryDate,
        "dc_delivery_time": dcDeliveryTime,
        "dc_status": dcStatus,
        "order_status": orderStatus,
        "dc_cancel_order": dcCancelOrder,
        "dc_delivery_distance": dcDeliveryDistance,
        "dc_deliveryboy_charge": dcDeliveryboyCharge,
        "dc_deliveryowner_charge": dcDeliveryownerCharge,
        "dc_payment_mode": dcPaymentMode,
        "delivery_charge": deliveryCharge,
        "dc_prod_giftstat": dcProdGiftstat,
        "dc_prod_giftdate": dcProdGiftdate,
        "dc_prod_gifttime": dcProdGifttime,
        "dc_prod_giftmsg": dcProdGiftmsg,
        "dc_prod_giftamount": dcProdGiftamount,
        "dc_prod_bundlestat": dcProdBundlestat,
        "dc_prod_bndle_offerid": dcProdBndleOfferid,
        "dc_prod_bndle_prodids": dcProdBndleProdids,
        "dc_prod_install_fee": dcProdInstallFee,
        "dc_prod_mrp": dcProdMrp,
      };
}
