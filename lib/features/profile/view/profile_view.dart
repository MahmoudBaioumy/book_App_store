import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(
                child: Stack(
              alignment: const Alignment(0, -14),
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.bluecolor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Profile',
                          style: getTitelstyle(
                              color: AppColor.white1color, fontSize: 40),
                        ),
                        const Gap(80),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.login_outlined,
                              color: AppColor.white1color,
                              size: 40,
                            ))
                      ],
                    ),
                    const Gap(15),
                    const CircleAvatar(
                      maxRadius: 80,
                      backgroundImage: AssetImage('assets/user.png'),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
