import 'package:flutter_application_2/core/Services/api_services.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/core/Services/local_services.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/core/co/constants.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_states.dart';

import 'package:flutter_application_2/features/shop/cart/data/get_cart_response/show_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BestSellerModel/bestseller_model.dart';

class homeCubit extends Cubit<homeStates> {
  homeCubit() : super(homeInitState());
  static homeCubit get(context) => BlocProvider.of(context);

  ShowCartModel? showCartModel;

  getdata() {
    emit(homeLoadingState());
    DioHelper.getData(
      url: EndPoint.bestseller,
    ).then((value) {
      // print(value.data);
///////////////import/////////////////////////////////////////////////////
      var model = BestSellerModel.fromJson(value.data);
      emit(homeSuccessState(model: model));
    }).catchError((onError) {
      emit(homeErrorState(error: 'error'));
    });
  }

  //* -------------- Cart ------------------------

  updateCart(int cartId, int quantity) {
    emit(UpdateCartLoading());

    try {
      ApiServices.post(
        endPoint: 'update-cart',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
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

  removeFromCart(int cartId) {
    emit(RemoveFromCartLoading());

    try {
      ApiServices.post(
        endPoint: 'remove-from-cart',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
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

  // get wishlist
  getShowCart() {
     emit(GetCartLoading());
    DioHelper.getData(
      url: EndPoint.showCart,
    token: SharedPreferencHelper.getData(key: 'token')
    ).then((value) {
      // print(value.data);
///////////////import/////////////////////////////////////////////////////
     showCartModel = ShowCartModel.fromJson(value.data);
      emit(GetCartSuccess());
    }).catchError((onError) {
      emit(GetCartError('error'));
    });
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
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
      ).then((value) {
        emit(PlaceOrderSuccess());
      });
    } catch (e) {
      emit(PlaceOrderError(e.toString()));
    }
  }
}
