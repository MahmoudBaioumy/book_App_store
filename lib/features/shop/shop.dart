import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';

class shop_view extends StatelessWidget {
  const shop_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: Text(
            'shop_view',
            style: getTitelstyle(color: AppColor.blackcolor),
          ))
        ],
      ),
    );
  }
}
