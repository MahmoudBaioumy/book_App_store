import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/info_statets.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/AllcategoriesModel%20.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/Allcategories_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllInfcubit extends Cubit<AllcategoriesState> {
  AllInfcubit() : super(AllcategoriesInitState());
  static AllInfcubit get(context) => BlocProvider.of(context);
  AllcategoriesModel? model;
  ///////send the id to get it //////////////////////////////////////
  getid({required int id}) {
    emit((AllcategoriesLoadingState()));
    /////////send the id ////////////////////////////////////////////
    DioHelper.grtDataBycategori(id: id).then((value) {
      model = AllcategoriesModel.fromJson(value.data);
      emit(AllcategoriesSuccessState(Model: model));
    }).catchError((onError) {
      emit(AllcategoriesErrorState(Error: onError.toString()));
    });
  }
}
