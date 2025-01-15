import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';

class TileWidget extends StatefulWidget {
  const TileWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: AppColor.bluecolor,
          child: Icon(
            widget.icon,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(child: Text(widget.text, style: getBodystyle())),
      ],
    );
  }
}
