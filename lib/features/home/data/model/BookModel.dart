import 'package:apps_flutter/features/home/data/model/sale_info.dart';
import 'package:apps_flutter/features/home/data/model/search_info.dart';
import 'package:apps_flutter/features/home/data/model/volume_info.dart';
import 'package:equatable/equatable.dart';

import 'access_info.dart';

class BookModel extends Equatable {

  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
      this.kind, 
      this.id, 
      this.etag, 
      this.selfLink, 
      this.volumeInfo,
      this.saleInfo, 
      this.accessInfo, 
      this.searchInfo,
  });

  BookModel.fromJson(dynamic json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null ?VolumeInfo.fromJson(json['volumeInfo']) : null;
    saleInfo = json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    accessInfo = json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null;
    searchInfo = json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    kind,
    id,
    searchInfo,
    accessInfo,
    saleInfo,
    volumeInfo,
    selfLink,
    etag,
  ];

}










