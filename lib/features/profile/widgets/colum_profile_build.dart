import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/data/cubit/auth_cubit.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/Text_Styles.dart';
import '../../../core/utils/app_colors.dart';

class ColumProfileBuild extends StatelessWidget {
  const ColumProfileBuild(
      {super.key, this.name, this.email, this.phone, this.city, this.image});
  final String? name;
  final String? email;
  final String? phone;
  final String? city;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: SizedBox(
          height: 235,
          width: double.infinity,
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
              ),
            ],
          ),
        )),
        const Gap(10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Column(
            children: [
              //////////////name//////////////////
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColor.bluecolor,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(name ?? '',
                            style: getTitelstyle(
                                color: AppColor.blackcolor,
                                fontWeight: FontWeight.normal))),
                  ],
                ),
              ),
              const Gap(10),
              ///////////email///////////////////////
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColor.bluecolor,
                      child: const Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(email ?? '',
                            style: getTitelstyle(
                                color: AppColor.blackcolor,
                                fontWeight: FontWeight.normal))),
                  ],
                ),
              ),
              const Gap(10),
              ////////////////phone////////////////////////
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColor.bluecolor,
                      child: const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: (phone == null)
                            ? Text(
                                'NotAdd',
                                style: getBodystyle(color: AppColor.blackcolor),
                              )
                            : Text(phone ?? '',
                                style:
                                    getBodystyle(color: AppColor.blackcolor))),
                  ],
                ),
              ),
              const Gap(10),
              ///////////city/////////////////////////////
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColor.bluecolor,
                      child: const Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: (city == null)
                            ? Text(
                                'NotAdd',
                                style: getBodystyle(color: AppColor.blackcolor),
                              )
                            : Text(city ?? '',
                                style:
                                    getBodystyle(color: AppColor.blackcolor))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
