import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/dio_helper/dio_helper.dart';
import 'package:flutter_application_2/core/Services/dio_helper/endPoint.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/features/auth/data/cubit/auth_states.dart';
import 'package:flutter_application_2/features/auth/view/Login/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LoginInitStates());

  static AuthCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var took, name;
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

      /////////// save name///////////////////////////
      SharedPreferencHelper.saveData(key: 'name', value: name);
      /////////savephone////////////////
      ///////////////save Token///////////////
      SharedPreferencHelper.saveData(key: 'token', value: took);
      //////////savecity/////////////////////////
    }).catchError((onError) {
      emit(LoginErrorStates(error: 'error'));
    });
  }

  var formKey2 = GlobalKey<FormState>();
  var displayName = TextEditingController();
  var EmailControllerRigester = TextEditingController();
  var PasswordControllerRigester = TextEditingController();
  var passwordController_Confirm = TextEditingController();
  var cityController = TextEditingController();
  var phoneController = TextEditingController();

  /// **********************************************//
  signup() {
    emit(RegisterLoadingStates());
    DioHelper.postData(url: EndPoint.register, data: {
      'name': displayName.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': passwordController_Confirm.text,
      'city': cityController.text,
      'phone': phoneController.text
    }).then((value) {
      emit(RegisterSuccessStates());
      print("value.dataaaaa");
      print(value.data);
    }).catchError((onError) {
      print(' objectobjectobjectobjectobjectobjectobjectobject');
      emit(RegisterErrorStates(error: 'error'));
    });
  }
}

////////////////////************//////////
class AuthService {
  final Dio _dio = Dio();
  final String apiUrl = 'https://codingarabic.online/api/logout';

  Future<void> logout(BuildContext context) async {
    try {
      // Get the token from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // Ensure token is not null
      if (token == null) {
        print('Token not found');
        return;
      }

      // Make the API call to log out
      final response = await _dio.post(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Clear the token and other user data from local storage
        await prefs.clear();

        // Navigate to the login screen
        pushAndRemoveUntil(context, const LoginView());
      } else {
        print('Logout failed: ${response.statusCode} - ${response.data}');
        // Optionally, show a message to the user
        _showErrorDialog(context, 'Logout failed. Please try again.');
      }
    } on DioException catch (e) {
      print('DioError during logout: ${e.response?.data}');
      _showErrorDialog(
          context, 'Network error during logout. Please try again.');
    } catch (e) {
      print('Error during logout: $e');
      _showErrorDialog(
          context, 'An unexpected error occurred. Please try again.');
    }
  }

  // Helper function to show an error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
