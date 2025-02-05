import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Auth/view_model/Auth/Auth_cubit/logout_cubit.dart';
import 'package:flutter_application_2/features/profile/view_model/cubit/cubit_profile_states.dart';
import 'package:flutter_application_2/features/profile/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_2/features/profile/view_model/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  late  String token;

  @override
  void initState() {

    token = SharedPreferencHelper.getData(key: 'token');


    ProfileCubit.get(context).getprofile(token);
    super.initState();
  }
  ProfileModel Model= ProfileModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: BlocConsumer<ProfileCubit,ProfileStates>(

            listener: (context, state) {
              if (state is ProfileSuccessState){
                print(state.Model);
                setState(() {
                  Model = state.Model!;
                });
              }
              if (state is ProfileErrorState){
                print(state.error);
              }

            },
            builder: (context, state) {
              if(state is ProfileSuccessState)
            {
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
                                const CircleAvatar(
                                  maxRadius: 80,
                                  backgroundImage: AssetImage('assets/user.png'),
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
                                  child: Text(Model.data!.name!,
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
                                  child: Text(Model.data!.email!,
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
                                  child: (Model.data!.phone! == null)
                                      ? Text(
                                    'NotAdd',
                                    style: getBodystyle(
                                        color: AppColor.blackcolor),
                                  )
                                      : Text(Model.data!.phone!,
                                      style: getBodystyle(
                                          color: AppColor.blackcolor))),
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
                                  child: (Model.data!.city! == null)
                                      ? Text(
                                    'NotAdd',
                                    style: getBodystyle(
                                        color: AppColor.blackcolor),
                                  )
                                      : Text(Model.data!.city!,
                                      style: getBodystyle(
                                          color: AppColor.blackcolor))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            },
          ),
        ),
      ),
    );
  }
}
