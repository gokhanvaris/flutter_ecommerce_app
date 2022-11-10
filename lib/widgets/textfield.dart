import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/theme/theme.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    this.isSecure = false,
    required this.icon,
    required this.label,
  }) : super(key: key);
  bool isSecure;
  String label;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
