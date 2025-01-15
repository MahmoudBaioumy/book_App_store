import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/features/fav/model/cubit/fav_cubit.dart';
import 'package:gap/gap.dart';

class BuildMoreInfo extends StatelessWidget {
  const BuildMoreInfo({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.salary,
    required this.Description,
    required this.discound,
  });
  final String image;
  final String name;
  final String type;
  final String salary;
  final String discound;
  final String Description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColor.white1color,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      favcubit.get(context).addfav(id: 1, token: 'token');
                    },
                    icon: Icon(Icons.favorite_border,
                        color: AppColor.white1color))
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: getTitelstyle(color: AppColor.blackcolor, fontSize: 22),
              ),
              const Gap(15),
              Row(
                children: [
                  Text(
                    type,
                    style: getBodystyle(color: AppColor.greycolor),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        ('$salary LE'),
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: AppColor.greycolor),
                      ),
                      const Gap(5),
                      Text(
                        ('$discound LE'),
                        style: getBodystyle(color: AppColor.bluecolor),
                      ),
                    ],
                  )
                ],
              ),
              const Gap(20),
              Text(
                'Description:',
                style: getTitelstyle(color: AppColor.blackcolor),
              ),
              const Gap(5),
              Text(
                Description,
                style: getBodystyle(color: AppColor.greycolor),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(15),
              CustomButton(
                text: 'Add To Cart ',
                onPressed: () {},
                 bgColor: AppColor.bluecolor,
                width: double.infinity,
                height: 50,
              )
            ],
          ),
        ),
      ],
    );
  }
}
