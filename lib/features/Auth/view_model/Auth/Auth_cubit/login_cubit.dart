import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/Auth/view_model/Auth/Auth_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class loginCubit extends Cubit<LoginStates> {
  loginCubit() : super(LoginInitStates());

  static loginCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var took, name, email, phone, city;
  var passwordController = TextEditingController();

  login() {
    emit(LoginLoadingStates());
    DioHelper.postData(url: EndPoint.Login, data: {
      'email': emailController.text,
      'password': passwordController.text
    }).then((value) async {
      emit(LoginSuccessStates());
      ///////get Token////////////////////////////////////
      took = value.data['data']['token'];
      ////////////get name /////////////////////////////
      name = value.data['data']['user']['name'];
      //////////////////getemil////////////////
      email = value.data['data']['user']['email'];
      //////////phone/////////////////////////
      phone = value.data['data']['user']['phone'];
      city = value.data['data']['user']['city'];
      /////////// save name///////////////////////////
      SharedPreferencHelper.saveData(key: 'name', value: name);
      /////////savephone////////////////
      SharedPreferencHelper.saveData(key: 'phone', value: phone);
      //////////SaveEmail///////////////////////////////
      SharedPreferencHelper.saveData(key: 'email', value: email);
      ///////////////save Token///////////////
      SharedPreferencHelper.saveData(key: 'token', value: took);
      //////////savecity/////////////////////////
      SharedPreferencHelper.saveData(key: 'city', value: city);
    }).catchError((onError) {
      emit(LoginErrorStates(error: 'error'));
    });
  }
}
