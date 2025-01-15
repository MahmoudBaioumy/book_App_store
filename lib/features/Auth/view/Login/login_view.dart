import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/email_vail.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/features/Auth/view/register/signup_view.dart';
import 'package:flutter_application_2/features/Auth/view_model/Auth/Auth_cubit/login_cubit.dart';
import 'package:flutter_application_2/features/Auth/view_model/Auth/Auth_cubit/login_states.dart';
import 'package:flutter_application_2/features/Home/buttom_nav/buttom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class login_view extends StatefulWidget {
  const login_view({super.key});

  @override
  State<login_view> createState() => _login_viewState();
}

class _login_viewState extends State<login_view> {
  @override
  @override
  bool isVisable = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginCubit(),
      child: Scaffold(
        body: Form(
          child: SingleChildScrollView(
            key: formKey,
            child: BlocConsumer<loginCubit, LoginStates>(
              listener: (context, state) {
                if (state is LoginSuccessStates) {
                  push(context, const bottom_nav());
                }
                if (state is LoginErrorStates) {
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
              },
              builder: (context, state) {
                var cubit = loginCubit.get(context);
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(children: [
                    Image.asset(
                      'assets/logo.PNG',
                      width: 150,
                    ),
                    const Gap(10),
                    Text(
                      'Login Now!',
                      style: getTitelstyle(
                          color: AppColor.bluecolor, fontSize: 30),
                    ),
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: getsmallstyle(),
                          ),
                          TextButton(
                              onPressed: () {
                                pushwithReplacement(
                                    context, const signup_viwe());
                              },
                              child: Text(
                                'Register Now',
                                style: getTitelstyle(
                                    color: AppColor.bluecolor,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: [
                        Container(
                          width: 334,
                          height: 294,
                          decoration: BoxDecoration(
                              color: AppColor.bluecolor,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        Container(
                          width: 330,
                          height: 290,
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
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Email';
                                    } else if (!emailValidate(value)) {
                                      return 'Please Enter Email Correct';
                                    }
                                    return null;
                                  },
                                ),
                                const Gap(10),
                                ////////////// second////////////
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
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
                                      return 'Please Enter password';
                                    }
                                    return null;
                                  },
                                ),

                                const Gap(15),
                                state is LoginLoadingStates
                                    ? const CircularProgressIndicator()
                                    : CustomButton(
                                        text: 'Login',
                                        fgColor: AppColor.white1color,
                                        onPressed: () async {
                                          cubit.login();
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
                  ]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
