import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CustomBookImage extends StatelessWidget {
  final String imageUrl;
  const CustomBookImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.9/ 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '' ,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
          AspectRatio(aspectRatio: 2.9/4,child:
          Shimmer.fromColors(child: Container(color: Colors.grey[400]),
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[300]!),) ,
          errorWidget: (context, url, error) =>
        const  Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
