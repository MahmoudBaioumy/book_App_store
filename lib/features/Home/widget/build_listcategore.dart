import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';

class categoriesbuild extends StatelessWidget {
  const categoriesbuild({
    super.key,
    required this.image,
    required this.titel,
  });
  final String image;
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
              color: Colors.grey[500], borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          titel,
          style: getTitelstyle(color: AppColor.white1color),
        ),
      ],
    );
  }
}
