import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/categories/view/all_product.dart';

class categoriesbuild extends StatelessWidget {
  const categoriesbuild({
    super.key,
    required this.image,
    required this.titel,
    required this.id,
  });
  final String image;
  final String titel;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(
          context,
          Allproductinfo(id:id)
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 80,
            width: 80,
            child: Text(
              titel,
              style: getTitelstyle(color: AppColor.white1color),
            ),
          ),
        ],
      ),
    );
  }
}
