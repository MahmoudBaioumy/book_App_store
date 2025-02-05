import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/core/constants/image_manger.dart';
import 'package:flutter_application_2/features/auth/view/Login/login_view.dart';
import 'package:flutter_application_2/features/buttom_nav/view/buttom_nav.dart';
import 'package:lottie/lottie.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

String? Token;

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    Token = SharedPreferencHelper.getData(key: 'token');

    Future.delayed(const Duration(seconds: 3), () async {
      print('$Token');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              Token != null ? const bottom_nav() : const LoginView()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                    child: LottieBuilder.asset(
                  ImageManger.IntroJson,
                  height: 350,
                  fit: BoxFit.cover,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
