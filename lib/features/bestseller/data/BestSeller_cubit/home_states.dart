import 'package:flutter_application_2/features/fav/data/model/get_wishlist_response.dart';

class homeStates {}

class homeInitState extends homeStates {}

class homeLoadingState extends homeStates {}

class homeSuccessState extends homeStates {}

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

class GetCartSuccess extends homeStates {
  get getCartResponse => null;
}

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

class AddToFavLoading extends homeStates {}

class AddToFavSuccess extends homeStates {}

class AddToFavError extends homeStates {
  final String error;
  AddToFavError(this.error);
}

class RemoveFromFavLoading extends homeStates {}

class RemoveFromFavSuccess extends homeStates {}

class RemoveFromFavError extends homeStates {
  final String error;
  RemoveFromFavError(this.error);
}

class GetWishlistLoading extends homeStates {}

class GetWishlistSuccess extends homeStates {
  final GetWishListResponse getWishListResponse;
  GetWishlistSuccess(this.getWishListResponse);
}

class GetWishlistError extends homeStates {
  final String error;
  GetWishlistError(this.error);
}
