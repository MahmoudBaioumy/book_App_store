import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:gap/gap.dart';

class BuildMoreInfo extends StatelessWidget {
  const BuildMoreInfo({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.salary,
    required this.Description, 
    required this.id,
  });
  final String image;
  final String name;
  final String type;
  final String salary;
  final String Description;
  final int id;
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
                    onPressed: () {},
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
                  Text(
                    salary,
                    style: getBodystyle(color: AppColor.bluecolor),
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
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(15),
              CustomButton(
                text: 'Add To Cart ',
                onPressed: () {},
                background: AppColor.bluecolor,
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
