import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/validator_controller.dart';
import '../theme/theme.dart';

class AppTextField extends StatelessWidget {
  final validatorController =
      Get.put(ValidatorController());
  AppTextField({
    Key? key,
    this.isSecure = false,
    required this.icon,
    required this.label,
    this.controller,
  }) : super(key: key);
  bool isSecure;
  String label;
  IconData icon;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: ((val) => validatorController
          .emptyValidator(val ?? '')),
      controller: controller,
      obscureText: isSecure,
      decoration: InputDecoration(
        focusColor: AppDefaultTheme()
            .themeData
            .scaffoldBackgroundColor,
        fillColor: AppDefaultTheme()
            .themeData
            .scaffoldBackgroundColor,
        hoverColor: AppDefaultTheme()
            .themeData
            .scaffoldBackgroundColor,
        suffixIcon: Icon(
          icon,
          color: AppDefaultTheme()
              .themeData
              .scaffoldBackgroundColor,
        ),
        label: Text(label),
        labelStyle: TextStyle(
            color: AppDefaultTheme()
                .themeData
                .scaffoldBackgroundColor),
        prefixStyle: TextStyle(
            color: AppDefaultTheme()
                .themeData
                .scaffoldBackgroundColor),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppDefaultTheme()
                    .themeData
                    .scaffoldBackgroundColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppDefaultTheme()
                    .themeData
                    .scaffoldBackgroundColor)),
      ),
    );
  }
}
