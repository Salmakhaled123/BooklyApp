import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return   Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: AspectRatio(
              aspectRatio: 2.9 / 4,
              child: Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(16)),
                  )),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
