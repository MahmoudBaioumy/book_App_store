import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.textcolor,
    this.bgColor,
    this.fgColor,
    this.height,
    this.width,
    this.fontWeight,
    this.radius,
    required this.onPressed,
    this.textStyle,
    this.isBorder = false,
  });
  final String text;
  final Color? textcolor;
  final FontWeight? fontWeight;
  final bool? isBorder;
  final Color? bgColor;
  final Color? fgColor;
  final double? height;
  final double? width;
  final double? radius;
  final TextStyle? textStyle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: isBorder == true
                ? const BorderSide()
                : const BorderSide(width: 0, color: Colors.transparent),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: bgColor ?? AppColor.bluecolor,
            foregroundColor: fgColor ?? AppColor.white1color,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle ??
                getBodystyle(
                    color: textcolor ?? AppColor.white1color,
                    fontWeight: fontWeight ?? FontWeight.normal),
          )),
    );
  }
}
