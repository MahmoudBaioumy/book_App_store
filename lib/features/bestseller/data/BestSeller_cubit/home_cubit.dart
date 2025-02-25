import 'package:flutter_application_2/core/Services/api_services.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/fav/data/model/get_wishlist_response.dart';
import 'package:flutter_application_2/features/cart/data/model/show_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/bestseller_model.dart';

class homeCubit extends Cubit<homeStates> {
  homeCubit() : super(homeInitState());

  static homeCubit get(context) => BlocProvider.of(context);

  ShowCartModel? showCartModel;
  BestSellerModel? bestSellerModel;
  getdata() {
    emit(homeLoadingState());
    DioHelper.getData(
      url: EndPoint.bestseller,
    ).then((value) {
      // print(value.data);

     bestSellerModel = BestSellerModel.fromJson(value.data);
      emit(homeSuccessState());
    }).catchError((onError) {
      emit(homeErrorState(error: 'error'));
    });
  }

  ///============================ Update Cart ===========================///

  updateCart(int cartId, int quantity) {
    emit(UpdateCartLoading());

    try {
      ApiServices.post(
        endPoint: 'update-cart',
        headers: {
          'Authorization':
              'Bearer ${SharedPreferencHelper.getData(key: 'token')}',
        },
        query: {
          'cart_item_id': cartId.toString(),
          'quantity': quantity.toString(),
        },
      ).then((value) {
        emit(UpdateCartSuccess());
      });
    } catch (e) {
      emit(UpdateCartError(e.toString()));
    }
  }
///============================= Remove From Cart========================///
  removeFromCart(int cartId) {
    emit(RemoveFromCartLoading());

    try {
      ApiServices.post(
        endPoint: 'remove-from-cart',
        headers: {
          'Authorization':
              'Bearer ${SharedPreferencHelper.getData(key: 'token')}',
        },
        query: {
          'cart_item_id': cartId.toString(),
        },
      ).then((value) {
        emit(RemoveFromCartSuccess());
      });
    } catch (e) {
      emit(RemoveFromCartError(e.toString()));
    }
  }
///============================= addToFav ========================///
  addToFav(int bookId) {
    emit(AddToFavLoading());

    try {
      ApiServices.post(
        endPoint: 'add-to-wishlist',
        query: {
          'product_id': bookId,
        },
        headers: {
          'Authorization':
              'Bearer ${SharedPreferencHelper.getData(key: 'token')}',
          // langugae
          // contentType
        },
      ).then((value) {
        emit(AddToFavSuccess());
      });
    } catch (e) {
      emit(AddToFavError(e.toString()));
    }
  }
///============================= removeFromWishList ========================///

  removeFromWishList(int bookId) {
    emit(RemoveFromFavLoading());

    try {
      ApiServices.post(
        endPoint: 'remove-from-wishlist',
        query: {
          'product_id': bookId,
        },
        headers: {
          'Authorization':
              'Bearer ${SharedPreferencHelper.getData(key: 'token')}',
        },
      ).then((value) {
        emit(RemoveFromFavSuccess());
      });
    } catch (e) {
      emit(RemoveFromFavError(e.toString()));
    }
  }
///============================= getWishlist ========================///
  getWishlist() {
    emit(GetWishlistLoading());
    try {
      ApiServices.get(
        endPoint: 'wishlist',
        headers: {
          'Authorization':
              'Bearer ${SharedPreferencHelper.getData(key: 'token')}',
          // langugae
          // contentType
        },
      ).then((value) {
        emit(GetWishlistSuccess(GetWishListResponse.fromJson(value)));
      });
    } catch (e) {
      emit(GetWishlistError(e.toString()));
    }
  }

  // get wishlist
  getShowCart() {
    print('value.data value.datarrrrrrrr');
    emit(GetCartLoading());
    try {
      DioHelper.getData(url: EndPoint.showCart).then((value) {
        print('value.data value.data');
///////////////import/////////////////////////////////////////////////////
        showCartModel = ShowCartModel.fromJson(value.data);
        emit(GetCartSuccess());
      }).catchError((onError) {
        print('value.data value.data ${onError.toString()}');
        emit(GetCartError('error'));
      });
    } catch (e) {
      print('value.data value.data ${e.toString()}');
    }
  }

  placeOrder(
      {required String name,
      required String email,
      required String phone,
      required String governorateId,
      required String address}) {
    emit(PlaceOrderLoading());
    try {
      ApiServices.post(
        endPoint: 'place-order',
        query: {
          'name': name,
          'email': email,
          'phone': phone,
          'governorate_id': governorateId,
          'address': address
        },
        headers: {
          'Authorization':
              'Bearer ${SharedPreferencHelper.getData(key: 'token')}',
        },
      ).then((value) {
        emit(PlaceOrderSuccess());
      });
    } catch (e) {
      emit(PlaceOrderError(e.toString()));
    }
  }
}
