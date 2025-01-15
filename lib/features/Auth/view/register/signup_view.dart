import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/email_vail.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/features/Auth/view/Login/login_view.dart';
import 'package:flutter_application_2/features/Auth/view_model/Auth/Auth_cubit/login_states.dart';
import 'package:flutter_application_2/features/Auth/view_model/Auth/Auth_cubit/rigister_cubit.dart';
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
      create: (context) => rigisterCubit(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<rigisterCubit, RegisterStates>(
            listener: (context, state) {
              if (state is RegisterErrorStates) {
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
                pushwithReplacement(context, const login_view());
              }
            },
            builder: (context, state) {
              var cubit = rigisterCubit.get(context);
              return SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.PNG',
                        width: 100,
                      ),
                      const Gap(10),
                      Text(
                        'join Us !',
                        style: getTitelstyle(
                            color: AppColor.bluecolor, fontSize: 25),
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text(
                              'already have an account?',
                              style: getsmallstyle(),
                            ),
                            TextButton(
                                onPressed: () {
                                  pushwithReplacement(
                                      context, const login_view());
                                },
                                child: Text(
                                  'Login',
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
                                  ////////////// first////////////
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
                                  ////////////// second////////////
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: cubit.emailController,
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
                                      } else if (!emailValidate(value)) {
                                        return 'Please Enter Your Email Correct';
                                      }
                                      return null;
                                    },
                                  ),
                                  const Gap(10),
                                  ////////////// third////////////
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isVisable,
                                    controller: cubit.passwordController,
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
                                  ////////////// fouth////////////
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
                                  const Gap(15),
                                  state is RegisterLoadingStates
                                      ? const CircularProgressIndicator()
                                      : CustomButton(
                                          text: 'Login',
                                          onPressed: () async {
                                            cubit.signup();
                                          },
                                          width: 400,
                                          background: AppColor.bluecolor,
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
