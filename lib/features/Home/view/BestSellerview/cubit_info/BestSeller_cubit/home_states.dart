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
//////////////////////////////////////////////* -------- Cart -------------//////////////////////////////////


class RemoveFromCartLoading extends homeStates {}

class RemoveFromCartSuccess extends homeStates {
  RemoveFromCartSuccess();
}

class RemoveFromCartError extends homeStates {
  final String error;
  RemoveFromCartError(this.error);
}

class UpdateCartLoading extends homeStates {}

class UpdateCartSuccess extends homeStates {
  UpdateCartSuccess();
}

class UpdateCartError extends homeStates {
  final String error;
  UpdateCartError(this.error);
}

class GetCartLoading extends homeStates {}

class GetCartSuccess extends homeStates {}

class GetCartError extends homeStates {
  final String error;
  GetCartError(this.error);
}
// order

class PlaceOrderLoading extends homeStates {}

class PlaceOrderSuccess extends homeStates {}

class PlaceOrderError extends homeStates {
  final String error;
  PlaceOrderError(this.error);
}
