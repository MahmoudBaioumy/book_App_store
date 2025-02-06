import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/auth/data/cubit/auth_cubit.dart';
import 'package:gap/gap.dart';

class ProfileHeaderBuild extends StatelessWidget {
  const ProfileHeaderBuild({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.ProfileTitel,
              style: getTitelstyle(
                  color: AppColor.white1color, fontSize: 40),
            ),
            const Gap(80),
            IconButton(
                onPressed: () async {
                  AuthService().logout(context);
                },
                icon: Icon(
                  Icons.login_outlined,
                  color: AppColor.white1color,
                  size: 40,
                ))
          ],
        ),
        const Gap(15),
        CircleAvatar(
          maxRadius: 80,
          backgroundImage: NetworkImage(image ?? ''),
        ),
      ],
    );
  }
}