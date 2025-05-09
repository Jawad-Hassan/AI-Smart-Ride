import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/utlis/app_fonts.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.transparent,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: StyleRefer.poppinsSemiBold.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
