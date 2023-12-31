import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';

import 'AccessInfo.dart';
import 'SaleInfo.dart';
import 'SearchInfo.dart';
import 'VolumeInfo.dart';

class BookModel extends BookEntity {
  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
            price: 0.0,
            title: volumeInfo.title!,
            image: volumeInfo.imageLinks?.thumbnail ?? '',
            authorName: volumeInfo.authors?.first ?? '',
            bookId: id!,
            rating: volumeInfo.averageRating);

  factory BookModel.fromJson(dynamic json) {
    return BookModel(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
      saleInfo:
          json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null,
      accessInfo: json['accessInfo'] != null
          ? AccessInfo.fromJson(json['accessInfo'])
          : null,
      searchInfo: json['searchInfo'] != null
          ? SearchInfo.fromJson(json['searchInfo'])
          : null,
    );
  }
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  final VolumeInfo volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    map['volumeInfo'] = volumeInfo.toJson();
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }
}
