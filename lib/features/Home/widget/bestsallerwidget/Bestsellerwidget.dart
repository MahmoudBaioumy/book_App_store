import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class Bestsellerwidget extends StatelessWidget {
  const Bestsellerwidget({
    super.key,
    required this.image,
    required this.text,
    required this.sallery,
    required this.discond,
    required this.sallerydis,
  });
  final String image;
  final String text;
  final String sallery;
  final String discond;
  final String sallerydis;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 100,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                image,
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.bluecolor,
                ),
                height: 20,
                width: 30,
                child: Text('$discond%'),
              )
            ],
          ),
          const Gap(10),
          Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: getTitelstyle(color: AppColor.blackcolor, fontSize: 14),
          ),
          const Gap(5),
          Text(
            '${sallery}L.E',
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: AppColor.greycolor),
          ),
          Text(
            '$sallerydis L.E',
            style: getBodystyle(color: AppColor.bluecolor),
          )
        ],
      ),
    );
  }
}
