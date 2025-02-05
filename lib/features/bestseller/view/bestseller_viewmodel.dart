import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/model/bestseller_model.dart';

class BestsellerViewModel {
  final homeCubit _cubit;

  BestsellerViewModel(this._cubit);
  
  List<Products> get products => _cubit.bestSellerModel?.data?.products ?? [];
}
