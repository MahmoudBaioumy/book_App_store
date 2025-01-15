import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class favBuilder extends StatelessWidget {
  const favBuilder({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.price,
    required this.priceafterdis,
  });
  final String image;
  final String name;
  final String type;
  final String price;
  final String priceafterdis;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 170,
      width: 400,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          ////////////////////////////////////////////////contaner image/////////////////////////////////////
          Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(20),
          Row(
            children: [
              /////////////////////////////////////////colum of text salary//////////////////////////////////////////////
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      name,
                      style: getTitelstyle(
                          color: AppColor.blackcolor, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    type,
                    style: getBodystyle(color: AppColor.greycolor),
                  ),
                  const Gap(10),
                  Text(
                    price,
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 14),
                  ),
                  Text(
                    priceafterdis,
                    style:
                        getBodystyle(color: AppColor.bluecolor, fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.favorite_outlined,
                    color: AppColor.bluecolor,
                    size: 30,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_shopping_cart_rounded,
                        color: AppColor.blackcolor,
                        size: 30,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
