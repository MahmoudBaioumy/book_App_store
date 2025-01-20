import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/Auth/view/Login/login_view.dart';
import 'package:flutter_application_2/features/Home/buttom_nav/buttom_nav.dart';
import 'package:lottie/lottie.dart';

class logo extends StatefulWidget {
  const logo({super.key});

  @override
  State<logo> createState() => _logoState();
}

String? Token;

class _logoState extends State<logo> {
  @override
  void initState() {
    Token = SharedPreferencHelper.getData(key: 'token');

    Future.delayed(const Duration(seconds: 3), () async {
      print('$Token');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              Token != null ? const bottom_nav() : const login_view()));
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
                  'assets/intro.json',
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
