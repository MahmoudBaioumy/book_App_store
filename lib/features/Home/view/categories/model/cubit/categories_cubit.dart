import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/Categori_Model.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/categories_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class categoriesCubit extends Cubit<categoriesState> {
  categoriesCubit() : super(categoriesInitState());
  static categoriesCubit get(context) => BlocProvider.of(context);

  getcategories() {
    emit(categoriesLoadingState());
    DioHelper.getData(url: EndPoint.categories).then((value) {
      var model = categoriesModel.fromJson(value.data);
      emit(categoriesSuccessState(Model: model));
    }).catchError((onError) {
      emit(categoriesErrorState(Error: 'Error'));
    });
  }
}

