import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Auth/view/Login/login_view.dart';
import 'package:flutter_application_2/features/Home/buttom_nav/buttom_nav.dart';
import 'package:gap/gap.dart';

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
      backgroundColor: AppColor.blackcolor,
      appBar: AppBar(
        backgroundColor: AppColor.blackcolor,
      ),
      body: Column(
        children: [
          const Gap(120),
          Center(
            child: Text(
              'B',
              style: getTitelstyle(color: Colors.amber, fontSize: 300),
            ),
          )
        ],
      ),
    );
  }
}
