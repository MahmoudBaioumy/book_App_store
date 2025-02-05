class categoriesState {}

class categoriesInitState extends categoriesState {}

class categoriesLoadingState extends categoriesState {}

class categoriesErrorState extends categoriesState {
  final String Error;

  categoriesErrorState({required this.Error});
}

class categoriesSuccessState extends categoriesState {}

class AllcategoriesInitState extends categoriesState {}

class AllcategoriesLoadingState extends categoriesState {}

class AllcategoriesErrorState extends categoriesState {
  final String Error;

  AllcategoriesErrorState({required this.Error});
}

class AllcategoriesSuccessState extends categoriesState {}
