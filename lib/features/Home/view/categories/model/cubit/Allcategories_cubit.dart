import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
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
    print('value.data value.data AllcategoriesLoadingState');
    /////////send the id ////////////////////////////////////////////
    DioHelper.grtDataBycategori(id: id).then((value) {
      print('value.data value.data ${value.data}');
      model = AllcategoriesModel.fromJson(value.data);
      print('value.data value.data ${model?.data?.name}');
      print('value.data value.data ${model?.data?.products?.length}');
      print('value.data value.data ${model?.data?.products?[0].discount}');
      emit(AllcategoriesSuccessState());
    }).catchError((onError) {
      emit(AllcategoriesErrorState(Error: onError.toString()));
    });
  }
}
