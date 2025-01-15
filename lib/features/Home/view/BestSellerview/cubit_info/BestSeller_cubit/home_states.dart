import 'package:flutter_application_2/features/Home/view/BestSellerview/BestSellerModel/bestseller_model.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/NewArrivalsmodel/NewArrivals_model.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/cubit/NewArrivals_cubit/NewArrivals_states.dart';

class homeStates {}

class homeInitState extends homeStates {}

class homeLoadingState extends homeStates {}

class homeSuccessState extends homeStates {
 BestSellerModel? model;

  homeSuccessState({required this.model});
}

class homeErrorState extends homeStates {
  final String error;

  homeErrorState({required this.error});
}
