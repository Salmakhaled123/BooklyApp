import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
   this.fontSize,
    this.onPressed,
    this.borderRadius,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius ?borderRadius;
  final String text;
final double ?fontSize;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius:borderRadius?? BorderRadius.circular(
                12,
              ))),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: fontSize
            ),
          )),
    );
  }
}
