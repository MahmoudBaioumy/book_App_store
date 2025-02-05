import 'package:flutter_application_2/features/categories/data/cubit/categories_cubit.dart';
import 'package:flutter_application_2/features/categories/data/model/Categori_Model.dart';

class CategoeirViewModel {
  
  final CategoriesCubit _categoriesCubit;

  CategoeirViewModel(this._categoriesCubit);
   
   
   List<Categories> get categories=> _categoriesCubit.categorimodel?.data?.categories ?? [];

}
