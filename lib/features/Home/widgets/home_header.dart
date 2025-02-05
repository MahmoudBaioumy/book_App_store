import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    required this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name',
              style: getTitelstyle(color: AppColor.blackcolor),
            ),
            const Gap(6),
            Text(
              AppStrings.HomeHint,
              style: getBodystyle(color: AppColor.greycolor),
            ),
          ],
        ),
        const Gap(25),
        const Expanded(
          child: CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(
                'https://codingarabic.online/admin/assets/img/default/user.jpg'),
          ),
        )
      ],
    );
  }
}