import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';

import 'package:flutter_application_2/features/profile/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_2/features/profile/view_model/profile_model.dart';
import 'package:flutter_application_2/features/profile/widgets/custom_textformfield.dart';
import 'package:flutter_application_2/features/profile/widgets/profile_header_build.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/app_colors.dart';

class ColumProfileBuild extends StatelessWidget {
  ColumProfileBuild({super.key,  this.profile});

  final ProfileModel? profile;

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
              ProfileHeaderBuild(image: profile?.data?.image??''),
            ],
          ),
        )),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                ///===================================** Name **======================================================================///
                TextFormFiledProfile(
                  name: profile?.data?.name ??'',
                  controller: ProfileCubit.NameController,
                  icon: Icon(
                    Icons.person,
                    color: AppColor.bluecolor,
                  ),
                ),
                const Gap(10),

                ///===================================** Email **======================================================================///
                TextFormFiledProfile(
                  name: profile?.data?.email ?? '',
                  type: true,
                  icon: Icon(
                    Icons.email,
                    color: AppColor.bluecolor,
                  ),
                ),
                const Gap(10),

                ///===================================** Phone **======================================================================///
                TextFormFiledProfile(
                  name: profile?.data?.phone ?? '',
                  keyboardType: TextInputType.phone,
                  controller: ProfileCubit.PhoneController,
                  icon: Icon(
                    Icons.phone,
                    color: AppColor.bluecolor,
                  ),
                ),
                const Gap(10),

                ///===================================** City **======================================================================///
                TextFormFiledProfile(
                  name: profile?.data?.city ?? '',
                  controller: ProfileCubit.CityController,
                  icon: Icon(
                    Icons.location_city,
                    color: AppColor.bluecolor,
                  ),
                ),
                const Gap(50),
                CustomButton(text: 'Update Profile', onPressed: () {})
              ],
            ),
          ),
        ),
      ],
    );
  }
}
