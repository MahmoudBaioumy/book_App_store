import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
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
}
