import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';

class CartRepo {
  final homeCubit homecubit;

  CartRepo({required this.homecubit});

  getShowCart() async {
    final cart = await homecubit.getShowCart();
    return cart.map((cart) => cart.fromJson(cart)).tolist();
  }
}
