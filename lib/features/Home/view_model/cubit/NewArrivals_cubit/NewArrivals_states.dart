import 'package:flutter_application_2/features/Home/view_model/NewArrivalsmodel/NewArrivals_model.dart';

class NewArrivalsState {}

class newarrivalsinitState extends NewArrivalsState {}

class newarrivalsloadingState extends NewArrivalsState {}

class newarrivalsSuccessState extends NewArrivalsState {
  NewArrivalsmodel? Model;
  newarrivalsSuccessState({required this.Model});
}

class newarrivalsErrorState extends NewArrivalsState {
  final String error;

  newarrivalsErrorState({required this.error});
}
