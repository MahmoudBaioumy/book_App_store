import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/info_statets.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/info_bestseller/Info_Model/Info_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Infcubit extends Cubit<infoStates> {
  Infcubit() : super(InfoIntstate());
  static Infcubit get(context) => BlocProvider.of(context);
   InfoModel? model;
  ///////send the id to get it ///////////////////////////////
  getid({required int id}) {
    emit(InfoLoadingState());
    /////////send the id ////////////////////////////////////////////
    DioHelper.grtDataById(id: id).then((value) 
    {
      model = InfoModel.fromJson(value.data);
      print(model);
      emit(InfoSuccessState(Model: model));
    }
    ).catchError((onError) {
      emit(InfoErrorState(error: onError.toString()));
    });
  }

  addToCart({required int bookId}) {
    emit(AddToCartLoading());
    print('addToCart addToCart ${bookId}');
    print('addToCart addToCart ${bookId}');
    DioHelper.postData(
      url: EndPoint.addToCart,
      token: SharedPreferencHelper.getData(key: 'token'),
      data: {'product_id': bookId}
    ).then((value) {
      
      print('addToCart addToCart ${value.data}');
      emit(AddToCartSuccess());
    }).catchError((onError) {
       print('addToCart addToCart catchError catchError ${onError.toString()}');
      emit(AddToCartError(onError.toString()));
    });
  }
   addTofav({required int bookId}) {
    emit(AddTofavLoading());
    print('addToCart addToCart ${bookId}');
    print('addToCart addToCart ${bookId}');
    DioHelper.postData(
      url: EndPoint.addfav,
      token: SharedPreferencHelper.getData(key: 'token'),
      data: {'product_id': bookId}
    ).then((value) {
      
      print('addToCart addToCart ${value.data}');
      emit(AddTofavSuccess());
    }).catchError((onError) {
       print('addToCart addToCart catchError catchError ${onError.toString()}');
      emit(AddTofavError(onError.toString()));
    });
  }
  
}
