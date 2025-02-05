import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/bestseller/data/model/bestseller_model.dart';
import 'package:gap/gap.dart';

class NewArrivalsDetils extends StatelessWidget {
  NewArrivalsDetils({
    super.key,
    this.newarrivals,
    this.isloading=false,
  });
  final Products? newarrivals;
  bool isloading ;
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
                (isloading==false)
                ? newarrivals?.image ?? ''
                :'https://pngimg.com/uploads/book/book_PNG51041.png',
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.bluecolor,
                ),
                height: 20,
                width: 30,
                child: Text(
                  (isloading==false)
                 ? '${newarrivals?.discount}%'
                 :'20'
                  ),
              )
            ],
          ),
          const Gap(10),
          Text(
            (isloading==false)
            ?newarrivals?.name ?? ''
            :'qedqedqedqdeq',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: getTitelstyle(color: AppColor.blackcolor, fontSize: 14),
          ),
          const Gap(5),
          Text(
            (isloading==false)
            ?'${newarrivals?.price}L.E'
            :'203',
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: AppColor.greycolor),
          ),
          Text(
            (isloading==false)
           ? '${newarrivals?.priceAfterDiscount} L.E':'212',
            style: getBodystyle(color: AppColor.bluecolor),
          )
        ],
      ),
    );
  }
}
