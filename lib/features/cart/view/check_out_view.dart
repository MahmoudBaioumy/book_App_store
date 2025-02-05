import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/constants/governorates_list.dart';
import 'package:flutter_application_2/core/constants/image_manger.dart';
import 'package:flutter_application_2/core/function/email_vail.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/core/widget/custom_back_btn.dart';
import 'package:flutter_application_2/core/widget/custom_dialogs.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/buttom_nav/view/buttom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.totalPrice});
  final String totalPrice;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  int governorateId = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<homeCubit, homeStates>(
      listener: (context, state) {
        if (state is PlaceOrderLoading) {
          showLoadingDialog(context);
        } else if (state is PlaceOrderSuccess) {
          Navigator.pop(context);
          showSuccessDialog();
        } else if (state is PlaceOrderError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColor.redcolor,
              content: Text(state.error),
            ),
          );
        }
      },
      child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: const Text('Checkout'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<homeCubit>().placeOrder(
                      name: usernameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      governorateId: governorateId.toString(),
                      address: addressController.text);
                }
              },
              text: 'Checkout',
              textStyle: getTitelstyle(color: AppColor.white1color),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.bluecolor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Total Price: ${widget.totalPrice} EGP',
                            style: getTitelstyle(),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    const Divider(),
                    const Gap(20),
                    Row(
                      children: [
                        Text(
                          'Customer Information',
                          style: getBodystyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!EmailValidate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Phone',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Address',
                      ),
                    ),
                    const Gap(15),
                    // DropdownButtonFormField(items: items, onChanged: onChanged),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white1color,
                      ),
                      child: DropdownButton(
                          dropdownColor: AppColor.white1color,
                          isExpanded: true,
                          value: governorateId,
                          onChanged: (value) {
                            setState(() {
                              governorateId = value as int;
                            });
                          },
                          items: governoratesList
                              .map((city) => DropdownMenuItem(
                                  value: city['id'],
                                  child: Text(
                                      city["governorate_name_en"].toString())))
                              .toList()),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  showSuccessDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => SimpleDialog(
              alignment: Alignment.center,
              backgroundColor: AppColor.white1color,
              contentPadding: const EdgeInsets.all(20),
              children: [
                const Gap(20),
                Image.asset(
                 ImageManger.DoneImage,
                  height: 150,
                  width: 150,
                ),
                const Gap(20),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.Success,
                          style: getTitelstyle(fontSize: 24)),
                      const Gap(20),
                      Text(
                        AppStrings.OrderSuccess,
                        textAlign: TextAlign.center,
                        style: getBodystyle(color: AppColor.bluecolor),
                      ),
                      const Gap(30),
                      CustomButton(
                        bgColor: AppColor.bluecolor,
                        textStyle: getBodystyle(color: AppColor.white1color),
                        text: 'Back To Home ',
                        onPressed: () {
                          pushAndRemoveUntil(context, const bottom_nav());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ));
  }
}
