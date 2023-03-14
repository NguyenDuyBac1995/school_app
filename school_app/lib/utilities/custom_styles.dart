import 'package:flutter/material.dart';
import 'package:school_app/utilities/colors.dart';

class CustomStyles {
  static InputDecoration inputDecorationBorder({
    String? hintText,
    Color hintColor = CustomColors.purpleColor,
    Widget? label,
    String? labelText,
    Widget? suffixIcon,
    Widget? suffix,
    String? suffixText,
    Widget? prefix,
    String? prefixText,
    Widget? prefixIcon,
    TextStyle? prefixStyle,
    Color fillColor = Colors.white,
    Color borderColor = CustomColors.purpleColor,
    double paddingSize = 16,
    double hintSize =15
  }) {
    return InputDecoration(
      fillColor: fillColor,
      filled: true,
      suffixIconColor:CustomColors.purpleColor,
      prefixIconColor: CustomColors.purpleColor,
      iconColor: CustomColors.purpleColor,
      suffixIcon: suffixIcon,
      suffix:suffix,
      suffixText:suffixText,
      prefix:prefix,
      prefixIcon:prefixIcon,
      hintText: hintText,
      hintStyle: TextStyle(
          color: hintColor, fontSize: hintSize, wordSpacing: 1.0),
      contentPadding: EdgeInsets.symmetric(vertical: paddingSize, horizontal: 24),
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: borderColor), // No border
        borderRadius: BorderRadius.circular(14), // Apply corner radius
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: borderColor), // No border
        borderRadius: BorderRadius.circular(14), // Apply corner radius
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 1, style: BorderStyle.solid, color: Colors.red), // No border
        borderRadius: BorderRadius.circular(14), // Apply corner radius
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 1, style: BorderStyle.solid, color: Colors.red), // No border
        borderRadius: BorderRadius.circular(14), // Apply corner radius
      ),
    );
  }
}
