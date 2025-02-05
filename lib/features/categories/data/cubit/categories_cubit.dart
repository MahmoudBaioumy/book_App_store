import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/features/categories/data/cubit/categories_States.dart';
import 'package:flutter_application_2/features/categories/data/model/Categori_Model.dart';
import 'package:flutter_application_2/features/categories/data/model/categoriesmodelbyid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<categoriesState> {
  CategoriesCubit() : super(categoriesInitState());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  categoriesModel? categorimodel;
  GetAllCategoires() {
    emit(categoriesLoadingState());
    DioHelper.getData(url: EndPoint.categories).then((value) {
      categorimodel = categoriesModel.fromJson(value.data);
      emit(categoriesSuccessState());
    }).catchError((onError) {
      emit(categoriesErrorState(Error: 'Error'));
    });
  }

//------------------------------------------------*************************************************************
  GetAcategoiresByIdModel? Model;
  ///////send the id to get it //////////////////////////////////////
  GetAcategoiresById({required int id}) {
    // model = null;
    emit((AllcategoriesLoadingState()));
    print('value.data value.data AllcategoriesLoadingState');
    /////////send the id ////////////////////////////////////////////
    DioHelper.grtDataBycategori(id: id).then((value) {
      print('value.data value.data ${value.data}');
      Model = GetAcategoiresByIdModel.fromJson(value.data);
      print('value.data value.data ${Model?.data?.name}');
      print('value.data value.data ${Model?.data?.products?.length}');
      print('value.data value.data ${Model?.data?.products?[0].discount}');
      emit(AllcategoriesSuccessState() as categoriesState);
    }).catchError((onError) {
      emit(AllcategoriesErrorState(Error: onError.toString())
          as categoriesState);
    });
  }
}
