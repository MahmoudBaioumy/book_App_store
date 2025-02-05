import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';


import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/cart/view/check_out_view.dart';
import 'package:flutter_application_2/features/cart/widgets/cart_item.dart';
import 'package:flutter_application_2/features/newarrivals/widgets/newarrivals_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late homeCubit homeCubits;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeCubits = homeCubit.get(context);
    homeCubits.getShowCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.card_travel,
          color: AppColor.bluecolor,
        ),
        title: Text(
          AppStrings.CartTitel,
          style: getTitelstyle(color: AppColor.bluecolor, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<homeCubit, homeStates>(
        buildWhen: (previous, current) =>
            current is GetCartSuccess || current is GetCartLoading,
        builder: (context, state) {
          if (state is GetCartSuccess) {
            return homeCubits.showCartModel == null ||
                    homeCubits.showCartModel?.data?.cartItems?.isEmpty == true
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          size: 120,
                          color: AppColor.greycolor,
                        ),
                        const Gap(30),
                        Text(AppStrings.CartEmpty),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: homeCubits
                                    .showCartModel?.data?.cartItems?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return CartItemWidget(
                                model: homeCubits
                                    .showCartModel?.data?.cartItems?[index],
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                              height: 30,
                            ),
                          ),
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            Text(
                              'Total: ${homeCubits.showCartModel?.data?.cartItems?.length ?? ""}',
                              style: getTitelstyle(color: AppColor.bluecolor),
                            ),
                            const Spacer(),
                            Expanded(
                                child: CustomButton(
                                    text: 'Checkout',
                                    textStyle: getBodystyle(
                                        color: AppColor.white1color),
                                    onPressed: () {
                                      push(
                                          context,
                                          CheckoutView(
                                            totalPrice: homeCubits.showCartModel
                                                    ?.data?.total ??
                                                '',
                                          ));
                                    }))
                          ],
                        ),
                      ],
                    ),
                  );
          } else {
            return Skeletonizer(
              enableSwitchAnimation: true,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return NewArrival_list_Widget(
                      id: 1,
                      salaryydiss: 235.toString(),
                      diss: 30.toString(),
                      image:
                          'https://pngimg.com/uploads/book/book_PNG51041.png',
                      name: 'Hands-On-Machineleading',
                      type: 'Software',
                      Sallery: 400.toString(),
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(15),
                  itemCount: 15),
            );
          }
        },
      ),
    );
  }
}
