import 'package:flutter_application_2/features/profile/view_model/profile_model.dart';

class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final ProfileModel? Model;

  ProfileSuccessState({required this.Model});
}

class ProfileErrorState extends ProfileStates {
  final String? error;

  ProfileErrorState({required this.error});
}