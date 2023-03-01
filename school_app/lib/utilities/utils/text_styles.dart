import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/utilities/colors.dart';

class TextStyles{
  static var textSize34 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: CustomColors.textColor,
    )
  );

  static var textSize20 = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: CustomColors.textColor,
      )
  );

  static var textSizeBold20 = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: CustomColors.textColor,
      )
  );

  static var textSize16 = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: CustomColors.textColor,
      )
  );

  static var textSize14 = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: CustomColors.textColor,
        wordSpacing: 2,
      )
  );

  static var textSizeBold14 = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: CustomColors.textColor,
      )
  );

  static var textSizeUnder12 = GoogleFonts.inter(
      textStyle: const TextStyle(
        decoration: TextDecoration.underline,
        fontStyle: FontStyle.italic,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: CustomColors.textColor,
      )
  );

  static var textSize12 = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: CustomColors.textColor,
      )
  );

  static var textNotoSizeBold12 = GoogleFonts.notoSans(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: CustomColors.textColor,
      )
  );


  static var textNotoSizeBold18 = GoogleFonts.notoSans(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: CustomColors.textColor,
      )
  );

  static var textNotoSize12 = GoogleFonts.notoSans(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: CustomColors.textColor,
      )
  );
  static var textNotoSize14 = GoogleFonts.notoSans(
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: CustomColors.textColor,
      )
  );
  static var textNotoSize16 = GoogleFonts.notoSans(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: CustomColors.textColor,
      )
  );

  static var textNotoSizeBold16 = GoogleFonts.notoSans(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: CustomColors.textColor,
      )
  );

  static var textPoppinSize15 = GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: CustomColors.textColor,
      )
  );



}