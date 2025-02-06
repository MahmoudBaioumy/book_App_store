import 'package:flutter_application_2/features/bestseller/data/model/bestseller_model.dart';


import 'package:flutter_application_2/features/profile/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_2/features/profile/view_model/profile_model.dart';


class ProfileViewModel {
  final ProfileCubit _profileCubit;

  ProfileViewModel(this._profileCubit);
  late ProfileModel data ;
  
}
