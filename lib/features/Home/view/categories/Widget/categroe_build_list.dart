import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/info_bestseller/view/info_BestSeller.dart';
import 'package:gap/gap.dart';

class categoriesWidget extends StatelessWidget {
  const categoriesWidget({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.Sallery,
    required this.disscond,
    required this.salarydiss,
    required this.id,
  });

  final String image;
  final String name;
  final String type;
  final String Sallery;
  final String disscond;
  final String salarydiss;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                push(
                    context,
                    moreinfo(
                      id: id,
                    ));
              },
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    width: 100,
                    height: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(image: NetworkImage(image))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.bluecolor,
                    ),
                    height: 20,
                    width: 30,
                    child: Text('$disscond%'),
                  )
                ],
              ),
            ),
            const Gap(25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  SizedBox(
                    height: 20,
                    width: 150,
                    child: Text(
                      name,
                      style:
                          getTitelstyle(color: AppColor.blackcolor, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    type,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    style: getBodystyle(color: AppColor.greycolor),
                  ),
                  const Gap(15),
                  Text(
                    '${Sallery}L.E',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: AppColor.greycolor),
                  ),
                  Text(
                    '${salarydiss}L.E',
                    style: getBodystyle(color: AppColor.bluecolor),
                  ),
                ],
              ),
            ),
            const Gap(25),
            Column(
              children: [
                const Gap(10),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: AppColor.blackcolor,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_shopping_cart,
                        size: 25, color: AppColor.blackcolor))
              ],
            )
          ],
        ),
      ),
    );
  }
}
