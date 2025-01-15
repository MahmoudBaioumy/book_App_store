class AllcategoriesState {}

class AllcategoriesInitState extends AllcategoriesState {}

class AllcategoriesLoadingState extends AllcategoriesState {}

class AllcategoriesErrorState extends AllcategoriesState {
  final String Error;

  AllcategoriesErrorState({required this.Error});
}

class AllcategoriesSuccessState extends AllcategoriesState {}
