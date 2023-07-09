import 'package:apps_flutter/features/home/data/model/retail_price.dart';

import 'list_price.dart';

class Offers {
  Offers({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,});

  Offers.fromJson(dynamic json) {
    finskyOfferType = json['finskyOfferType'];
    listPrice = json['listPrice'];
    retailPrice = json['retailPrice'] != null ? RetailPrice.fromJson(json['retailPrice']) : null;
  }
  int? finskyOfferType;
  Map<String,dynamic>? listPrice;
  RetailPrice? retailPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['finskyOfferType'] = finskyOfferType;
    map['listPrice'] = listPrice;
    if (retailPrice != null) {
      map['retailPrice'] = retailPrice?.toJson();
    }
    return map;
  }

}
