import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/features/profile/view_model/cubit/cubit_profile_states.dart';
import 'package:flutter_application_2/features/profile/view_model/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModel? model;
 static TextEditingController NameController = TextEditingController();
  static TextEditingController PhoneController = TextEditingController();
 static TextEditingController CityController = TextEditingController();
  getprofile(String token) {
    emit(ProfileLoadingState());
    DioHelper.getData(url: EndPoint.GetProfile).then((value) {
      model = ProfileModel.fromJson(value.data);
      emit(ProfileSuccessState(Model: model));
    }).catchError((e, s) {
      print("$e,$s");
      emit(ProfileErrorState(error: 'error'));
    });
  }
}
