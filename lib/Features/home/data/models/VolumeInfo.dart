import 'IndustryIdentifiers.dart';
import 'ReadingModes.dart';
import 'PanelizationSummary.dart';
import 'ImageLinks.dart';

class VolumeInfo {
  VolumeInfo({
  this.averageRating,
   this.ratingsCount,
      this.title, 
      this.subtitle, 
      this.authors, 
      this.publisher, 
      this.publishedDate, 
      this.description, 
      this.industryIdentifiers, 
      this.readingModes, 
      this.pageCount, 
      this.printType, 
      this.categories, 
      this.maturityRating, 
      this.allowAnonLogging, 
      this.contentVersion, 
      this.panelizationSummary, 
     required  this.imageLinks,
      this.language, 
      this.previewLink, 
      this.infoLink, 
      this.canonicalVolumeLink,});

 factory VolumeInfo.fromJson(dynamic json)
  {
  return VolumeInfo(  title : json['title'],
      subtitle : json['subtitle'],
      authors :(json['authors'] as List<dynamic>?)?.cast<String>()  ,
  publisher : json['publisher'],
  publishedDate : json['publishedDate'],
  description : json['description'],
      averageRating: json['averageRating'] ,
      ratingsCount: json['ratingsCount'],
  readingModes : json['readingModes'] != null ? ReadingModes.fromJson(json['readingModes']) : null,
  pageCount : json['pageCount'],
  printType : json['printType'],
  categories : (json['categories']as List<dynamic>?)?.cast<String>(),
  maturityRating : json['maturityRating'],
  allowAnonLogging : json['allowAnonLogging'],
  contentVersion : json['contentVersion'],
  panelizationSummary : json['panelizationSummary'] != null ? PanelizationSummary.fromJson(json['panelizationSummary']) : null,
  imageLinks :json['imageLinks']==null? null: ImageLinks.fromJson(json['imageLinks'] ),
  language :json['language'],
  previewLink : json['previewLink'],
  infoLink :json['infoLink'],
  canonicalVolumeLink : json['canonicalVolumeLink']);
  }
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
 final ImageLinks ?imageLinks;
  final num ?averageRating;
  final int ?ratingsCount;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['authors'] = authors;
    map['publisher'] = publisher;
    map['publishedDate'] = publishedDate;
    map['description'] = description;
    if (industryIdentifiers != null) {
      map['industryIdentifiers'] = industryIdentifiers?.map((v) => v.toJson()).toList();
    }
    if (readingModes != null) {
      map['readingModes'] = readingModes?.toJson();
    }
    map['pageCount'] = pageCount;
    map['printType'] = printType;
    map['categories'] = categories;
    map['maturityRating'] = maturityRating;
    map['allowAnonLogging'] = allowAnonLogging;
    map['contentVersion'] = contentVersion;
    if (panelizationSummary != null) {
      map['panelizationSummary'] = panelizationSummary?.toJson();
    }
    if (imageLinks != null) {
      map['imageLinks'] = imageLinks?.toJson();
    }
    map['language'] = language;
    map['previewLink'] = previewLink;
    map['infoLink'] = infoLink;
    map['canonicalVolumeLink'] = canonicalVolumeLink;
    return map;
  }

}
// if (json['industryIdentifiers'] != null) {
//   industryIdentifiers = [];
//   json['industryIdentifiers'].forEach((v) {
//     industryIdentifiers?.add(IndustryIdentifiers.fromJson(v));
//   });
// }