
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 10, left: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.greycolor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}