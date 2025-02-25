import 'package:flutter_application_2/features/bestseller/data/model/Info_Model.dart';

class infoStates {}

class InfoIntstate extends infoStates {}

class InfoLoadingState extends infoStates {}

class InfoSuccessState extends infoStates {
  final InfoModel? Model;

  InfoSuccessState({required this.Model});
}

class InfoErrorState extends infoStates {
  final String error;

  InfoErrorState({required this.error});
}

class AddToCartLoading extends infoStates {}

class AddToCartSuccess extends infoStates {}

class AddToCartError extends infoStates {
  final String error;
  AddToCartError(this.error);
}
class AddTofavLoading extends infoStates {}

class AddTofavSuccess extends infoStates {}

class AddTofavError extends infoStates {
  final String error;
  AddTofavError(this.error);
}
