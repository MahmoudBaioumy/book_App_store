import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';

class fav_view extends StatelessWidget {
  const fav_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: Text(
            'fav',
            style: getTitelstyle(color: AppColor.blackcolor),
          ))
        ],
      ),
    );
  }
}
