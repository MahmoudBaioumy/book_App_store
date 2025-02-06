import 'package:flutter/material.dart';

class TextFormFiledProfile extends StatelessWidget {
  const TextFormFiledProfile({
    super.key,
    required this.name,
    required this.icon,
     this.controller,
    this.type,
     this.keyboardType,
  });

  final String name;
  final Icon icon;
  final TextEditingController? controller;
  final bool? type;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType ,
      readOnly: type ?? false,
      controller: controller,
      decoration: InputDecoration(
          hintText: name,
          prefixIcon: icon,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(25),
          ))),
    );
  }
}
