import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/features/Auth/view/Login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio();
  final String apiUrl =
      'https://codingarabic.online/api/logout'; 
   

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
        pushAndRemoveUntil(context, const login_view());
      } else {
        print('Logout failed: ${response.statusCode} - ${response.data}');
        // Optionally, show a message to the user
        _showErrorDialog(context, 'Logout failed. Please try again.');
      }
    } on DioError catch (e) {
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
