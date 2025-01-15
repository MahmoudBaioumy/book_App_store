import 'package:flutter_application_2/features/Home/view/categories/model/Categori_Model.dart';

class categoriesState {}

class categoriesInitState extends categoriesState {}

class categoriesLoadingState extends categoriesState {}

class categoriesErrorState extends categoriesState {
  final String Error;

  categoriesErrorState({required this.Error});
}

class categoriesSuccessState extends categoriesState {
  categoriesModel? Model;
  categoriesSuccessState({required this.Model});
}
