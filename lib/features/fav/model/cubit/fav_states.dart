import 'package:flutter_application_2/features/fav/model/favModel.dart';

class favStates {}

class favIntstate extends favStates {}

class favoLoadingState extends favStates {}

class favSuccessState extends favStates {
  final favModel? Model;

  favSuccessState({required this.Model});
}

class favErrorState extends favStates {
  final String error;

  favErrorState({required this.error});
}
