import 'package:flutter_application_2/features/Home/view_model/BestSellerModel/bestseller_model.dart';
import 'package:flutter_application_2/features/Home/view_model/NewArrivalsmodel/NewArrivals_model.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/NewArrivals_cubit/NewArrivals_states.dart';

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
