import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/model/bestseller_model.dart';

class NewarrivalsModel {
  final homeCubit _homeCubit;

  NewarrivalsModel(this._homeCubit);

  List<Products> get products =>
      _homeCubit.bestSellerModel?.data?.products ?? [];
}
