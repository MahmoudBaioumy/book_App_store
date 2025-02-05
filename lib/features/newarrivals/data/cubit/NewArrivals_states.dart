class NewArrivalsState {}

class newarrivalsinitState extends NewArrivalsState {}

class newarrivalsloadingState extends NewArrivalsState {}

class newarrivalsSuccessState extends NewArrivalsState {}

class newarrivalsErrorState extends NewArrivalsState {
  final String error;

  newarrivalsErrorState({required this.error});
}
