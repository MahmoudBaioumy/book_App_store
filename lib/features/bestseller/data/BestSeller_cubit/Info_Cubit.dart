import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/info_statets.dart';
import 'package:flutter_application_2/features/bestseller/data/model/Info_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Infcubit extends Cubit<infoStates> {
  Infcubit() : super(InfoIntstate());
  static Infcubit get(context) => BlocProvider.of(context);
  InfoModel? model;

  ///======================== getInfo ====================///
  getid({required int id}) {
    emit(InfoLoadingState());

    ///======================== send the id ====================///
    DioHelper.grtDataById(id: id).then((value) {
      model = InfoModel.fromJson(value.data);
      print(model);
      emit(InfoSuccessState(Model: model));
    }).catchError((onError) {
      emit(InfoErrorState(error: onError.toString()));
    });
  }

  ///=================== Add To Cart ===========================///
  addToCart({required int bookId}) {
    emit(AddToCartLoading());
    DioHelper.postData(
        url: EndPoint.addToCart,
        token: SharedPreferencHelper.getData(key: 'token'),
        data: {'product_id': bookId}).then((value) {
      emit(AddToCartSuccess());
    }).catchError((onError) {
      emit(AddToCartError(onError.toString()));
    });
  }

  ///================== Add To Fav ===========================///
  addTofav({required int bookId}) {
    emit(AddTofavLoading());

    DioHelper.postData(
        url: EndPoint.addfav,
        token: SharedPreferencHelper.getData(key: 'token'),
        data: {'product_id': bookId}).then((value) {
      emit(AddTofavSuccess());
    }).catchError((onError) {
      emit(AddTofavError(onError.toString()));
    });
  }
}
