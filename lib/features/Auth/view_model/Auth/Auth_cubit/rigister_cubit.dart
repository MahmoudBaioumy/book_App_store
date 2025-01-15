import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/features/Auth/view_model/Auth/Auth_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class rigisterCubit extends Cubit<RegisterStates> {
  rigisterCubit() : super(RegisterInitStates());

  static rigisterCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var displayName = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordController_Confirm = TextEditingController();

  signup() {
    emit(RegisterLoadingStates());
    DioHelper.postData(url: EndPoint.register, data: {
      'name': displayName.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': passwordController_Confirm.text
    }).then((value) {
      emit(RegisterSuccessStates());
      print(value.data);
    }).catchError((onError) {
      emit(RegisterErrorStates(error: 'error'));
    });
  }
}
