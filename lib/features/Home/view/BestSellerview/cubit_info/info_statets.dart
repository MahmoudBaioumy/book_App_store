import 'package:flutter_application_2/features/Home/view/BestSellerview/info_bestseller/Info_Model/Info_Model.dart';

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
