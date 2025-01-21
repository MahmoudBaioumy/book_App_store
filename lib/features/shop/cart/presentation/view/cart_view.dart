import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/shop/cart/presentation/view/check_out_view.dart';
import 'package:flutter_application_2/features/shop/cart/presentation/widgets/cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
          'My Cart',
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
                        const Text('No Books in cart'),
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
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.bluecolor,
              ),
            );
          }
        },
      ),
    );
  }
}
