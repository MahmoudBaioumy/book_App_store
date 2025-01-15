import 'package:flutter_application_2/features/Home/view/categories/model/AllcategoriesModel%20.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/Categori_Model.dart';

class AllcategoriesState {}

class AllcategoriesInitState extends AllcategoriesState {}

class AllcategoriesLoadingState extends AllcategoriesState {}

class AllcategoriesErrorState extends AllcategoriesState {
  final String Error;

  AllcategoriesErrorState({required this.Error});
}

class AllcategoriesSuccessState extends AllcategoriesState {
  AllcategoriesModel? Model;
  AllcategoriesSuccessState({required this.Model});
}
