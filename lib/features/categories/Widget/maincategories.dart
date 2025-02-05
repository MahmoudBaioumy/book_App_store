import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/categories/data/model/Categori_Model.dart';
import 'package:flutter_application_2/features/categories/view/all_product.dart';

class Maincategories extends StatelessWidget {
  const Maincategories({
    super.key,
    required this.category
  });
  final Categories category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(
          context,
          Allproductinfo(id:category.id??-1)
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
              'assets/immage3.jpg',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 80,
            width: 80,
            child: Text(
              category.name?? '',
              style: getTitelstyle(color: AppColor.white1color),
            ),
          ),
        ],
      ),
    );
  }
}
