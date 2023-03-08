import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/utilities/colors.dart';

class TextStyles{
  static TextStyle textInterBold(double size) =>
  GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.bold,
       color: CustomColors.purpleColor
      );

  static TextStyle textInterMedium(double size )=>
  GoogleFonts.inter(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: CustomColors.purpleColor,
  );

  static TextStyle textNotoSanBold(double size)=>
  GoogleFonts.notoSans(
    fontSize: size,
    fontWeight: FontWeight.bold,
    color: CustomColors.purpleColor,
  );

  static TextStyle textNotoSanMedium(double size)=>
  GoogleFonts.notoSans(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: CustomColors.purpleColor
  );

  static TextStyle textPoppinMedium(double size)=>
  GoogleFonts.poppins(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: CustomColors.purpleColor
  );

  static TextStyle textPoppinBold(double size,{bool color = true} )=>
      GoogleFonts.poppins(
          fontSize: size,
          fontWeight: FontWeight.w600,
          color: color?Color(0xff14142B):Color(0xffA0A3BD)
      );
}