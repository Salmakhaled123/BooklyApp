class ImageLinks {
  ImageLinks({
     // this.smallThumbnail,
     this.thumbnail,});

  factory ImageLinks.fromJson(dynamic json)
  {
    return ImageLinks(//smallThumbnail : json['smallThumbnail'],
        thumbnail : json['thumbnail']);
  }
  //String ? smallThumbnail;
  String ?thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
   // map['smallThumbnail'] = smallThumbnail;
    map['thumbnail'] = thumbnail;
    return map;
  }

}