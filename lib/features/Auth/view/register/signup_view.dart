import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/constants/image_manger.dart';
import 'package:flutter_application_2/core/function/email_vail.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/features/auth/data/cubit/auth_cubit.dart';
import 'package:flutter_application_2/features/auth/data/cubit/auth_states.dart';
import 'package:flutter_application_2/features/auth/view/Login/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class signup_viwe extends StatefulWidget {
  const signup_viwe({super.key});

  @override
  State<signup_viwe> createState() => _signup_viweState();
}

class _signup_viweState extends State<signup_viwe> {
  @override
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is RegisterErrorStates) {
                print(state.error.toString());
                /************/ //---------------------------------------------//************ */
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: AppColor.bluecolor,
                          content: Wrap(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Ops Some thing is wrong',
                                    style: getTitelstyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
              }

              if (state is RegisterSuccessStates) {
                pushwithReplacement(context, const LoginView());
              }
            },
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return SingleChildScrollView(
                child: Form(
                  key: cubit.formKey2,
                  child: Column(
                    children: [
                      Image.asset(
                        ImageManger.LogoImage,
                        width: 100,
                      ),
                      const Gap(10),
                      Text(
                        AppStrings.RigisterText,
                        style: getTitelstyle(
                            color: AppColor.bluecolor, fontSize: 25),
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text(
                              AppStrings.Loginhint,
                              style: getsmallstyle(),
                            ),
                            TextButton(
                                onPressed: () {
                                  pushwithReplacement(
                                      context, const LoginView());
                                },
                                child: Text(
                                  AppStrings.loginTextButton,
                                  style: getTitelstyle(
                                      color: AppColor.bluecolor,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      const Gap(4),
                      Stack(
                        alignment: const AlignmentDirectional(0, 0),
                        children: [
                          Container(
                            width: 334,
                            height: 494,
                            decoration: BoxDecoration(
                                color: AppColor.bluecolor,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          Container(
                            width: 330,
                            height: 490,
                            decoration: BoxDecoration(
                                color: AppColor.white1color,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  ////////////// Name////////////
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: cubit.displayName,
                                    decoration: InputDecoration(
                                      hintText: 'Name',
                                      hintStyle: getsmallstyle(
                                          color: AppColor.bluecolor,
                                          fontWeight: FontWeight.w600),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: AppColor.bluecolor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Your Name';
                                      }
                                      return null;
                                    },
                                  ),
                                  const Gap(10),
                                  /***************/ //Email////////////// */
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: cubit.EmailControllerRigester,
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: getsmallstyle(
                                          color: AppColor.bluecolor,
                                          fontWeight: FontWeight.w600),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: AppColor.bluecolor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Email';
                                      } else if (!EmailValidate(value)) {
                                        return 'Please Enter Your Email Correct';
                                      }
                                      return null;
                                    },
                                  ),
                                  const Gap(10),

                                  /**************************password*/ ///****/*/*/*/*/*/*/*/*/*/*/*/*/ */ */
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isVisable,
                                    controller:
                                        cubit.PasswordControllerRigester,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: getsmallstyle(
                                          color: AppColor.bluecolor,
                                          fontWeight: FontWeight.w600),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: AppColor.bluecolor,
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVisable = !isVisable;
                                            });
                                          },
                                          icon: Icon(
                                            (isVisable)
                                                ? Icons.remove_red_eye
                                                : Icons.visibility_off_rounded,
                                            color: AppColor.bluecolor,
                                          )),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Your Password';
                                      }
                                      return null;
                                    },
                                  ),
                                  const Gap(10),
                                  /**************************Confirm password*/ ///****/*/*/*/*/*/*/*/*/*/*/*/*/ */ */
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: isVisable,
                                    controller:
                                        cubit.passwordController_Confirm,
                                    decoration: InputDecoration(
                                      hintText: 'Confirm password',
                                      hintStyle: getsmallstyle(
                                          color: AppColor.bluecolor,
                                          fontWeight: FontWeight.w600),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: AppColor.bluecolor,
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVisable = !isVisable;
                                            });
                                          },
                                          icon: Icon(
                                            (isVisable)
                                                ? Icons.remove_red_eye
                                                : Icons.visibility_off_rounded,
                                            color: AppColor.bluecolor,
                                          )),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Confirm Password';
                                      } else if (cubit
                                              .passwordController.text !=
                                          cubit.passwordController_Confirm
                                              .text) {
                                        return 'Please Enter Your Password Correct';
                                      }
                                      return null;
                                    },
                                  ),
                                  const Gap(10),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: cubit.cityController,
                                    decoration: InputDecoration(
                                      hintText: 'city',
                                      hintStyle: getsmallstyle(
                                          color: AppColor.bluecolor,
                                          fontWeight: FontWeight.w600),
                                      prefixIcon: Icon(
                                        Icons.location_city,
                                        color: AppColor.bluecolor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter city';
                                      }
                                      return null;
                                    },
                                  ),
                                  const Gap(5),
                                  /****************************/ //textformphone//////////////////////////////******** */
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: cubit.phoneController,
                                    decoration: InputDecoration(
                                      hintText: 'phone',
                                      hintStyle: getsmallstyle(
                                          color: AppColor.bluecolor,
                                          fontWeight: FontWeight.w600),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: AppColor.bluecolor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter phone';
                                      }
                                      return null;
                                    },
                                  ),

                                  const Gap(15),
                                  state is RegisterLoadingStates
                                      ? const CircularProgressIndicator()
                                      : CustomButton(
                                          text: 'Login',
                                          onPressed: () async {
                                            print(
                                                'erooooooooooooooooooooooooooooooo');
                                            print(cubit.signup());
                                            cubit.signup();
                                          },
                                          width: 400,
                                          bgColor: AppColor.bluecolor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
