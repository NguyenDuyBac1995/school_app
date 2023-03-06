import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/text_styles.dart';

import '../assets_common.dart';

class Common {
  TextFormField loginTextField({
    String? labelValue,
    String? hintvalue,
    bool? validation,
    TextEditingController? controller,
    TextStyle? textStyle,
    String? validationErrorMsg,
    bool obscureText = false,
    bool isReadOnly = false,
    Widget? icons,
    bool suffixIcons = false,
    VoidCallback? changeIcons,
    FocusNode? fn,
  }) {
    return TextFormField(
      style: textStyle,
      controller: controller,
      obscureText: obscureText,
      readOnly: isReadOnly,
      focusNode: fn,
      enableInteractiveSelection: true,
      validator: (String? value) {
        if (validation!) {
          if (value!.isEmpty) {
            return validationErrorMsg;
          }
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          prefix: SizedBox(width: 10),
          suffixIcon: suffixIcons
              ? IconButton(
                  icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    changeIcons!();
                  },
                )
              : null,
          filled: true,
          fillColor: Color(0xffEFF0F6),
          labelText: labelValue,
          hintText: hintvalue,
          hintStyle: TextStyles.textPoppinMedium(17),
          labelStyle: TextStyles.textPoppinMedium(17),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.textColor),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.textColor),
              borderRadius: BorderRadius.circular(15)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.textColor),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  TextFormField commentTextField({
    String? hintValue,
    TextEditingController? controller,
    Widget? suffixIcon,
    bool? validation,
    TextStyle? textStyle,
    String? validationErrorMsg,
    Color colorBorder = Colors.white,
    double sizeBorder = 16,
    TextStyle? hintStyle ,
    double veticalSize = 18
  }) {
    return TextFormField(
      validator: (String? value) {
      if (validation!) {
        if (value!.isEmpty) {
          return validationErrorMsg;
        }
      }
    },
      style: textStyle,
      controller: controller,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.indigoAccent, fontSize: 15),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: veticalSize),
        hintText: hintValue??'Aa',
        hintStyle: hintStyle,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeBorder),
            borderSide: BorderSide(color: colorBorder)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeBorder),
            borderSide: BorderSide(color: colorBorder)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizeBorder),
            borderSide: BorderSide(color: colorBorder)),
        suffixIcon: suffixIcon,
      ),
    );
  }

  TextFormField remindTextField({
    String? hintValue,
    TextEditingController? controller,
    int? maxLines,
    TextStyle? textStyle,
    bool? validation,
    String? validationError,
    VoidCallback? callback,
    Widget? prefixIcon,
    bool suffixIcon = false,
    Color borderColor = CustomColors.mainTabColor,
    double hintSize = 16,
  }) {
    return TextFormField(
      controller: controller,
      style: textStyle,
      maxLines: maxLines,
      validator: (String? value) {
        if (validation!) {
          if (value!.isEmpty) {
            validationError;
          }
        }
      },
      onTap: (){
        callback!();
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        filled: true,
        fillColor: Colors.white,
          hintText: hintValue,
          hintStyle: TextStyles.textInterMedium(hintSize)
              .copyWith(color: CustomColors.textColor.withOpacity(0.5)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon?Icon(Icons.keyboard_arrow_down, size: 50,color: CustomColors.textColor,):SizedBox(),
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(color: borderColor, width: 1),
    ),
       focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color:  borderColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color:  borderColor, width: 1),
        ),
      ),
    );
  }


  Widget homeItemStudent({
    String? name,
    String? className,
    String? teacherName,
    String? avatarAssets,
    String? itemName,
    required double width,
    required double height,
    Function? callBackLeft,
    Function? callBackRight,
    bool boxItem = true,
    VoidCallback? callBackTop,
  }) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Expanded(child: SizedBox(), flex: 1),
          Container(
            height: boxItem ? height * 0.25 : height * 0.8,
            width: width,
            child: GestureDetector(
              onTap: () {
                callBackTop!();
              },
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                      flex: 14,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomIcon(avatarAssets!, size: 58),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name ?? '',
                                style: TextStyles.textInterBold(16),
                              ),
                              SizedBox(height: 12),
                              Text(
                                className ?? '',
                                style: TextStyles.textInterMedium(12),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Cô $teacherName",
                                style: TextStyles.textInterMedium(12),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox(), flex: 1),
          boxItem
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: height * 0.5,
                        width: width * 0.4,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: CustomColors.pinkColor,
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pinkAccent,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Column(
                          children: [
                            SvgPicture.asset(Images.homeItemLeft),
                            Expanded(child: SizedBox()),
                            Text(itemName ?? '',
                                style: TextStyles.textInterBold(16).copyWith(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      onTap: () {
                        callBackLeft!();
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        height: height * 0.5,
                        width: width * 0.4,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: CustomColors.tabActiveColor,
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Column(
                          children: [
                            SvgPicture.asset(Images.homeItemRight),
                            SizedBox(height: 20),
                            Text('Nhóm lớp',
                                style: TextStyles.textInterBold(16)),
                          ],
                        ),
                      ),
                      onTap: () {
                        callBackRight!();
                      },
                    ),
                  ],
                )
              : const SizedBox(),
          Expanded(child: SizedBox(), flex: 1),
          Container(
              margin: EdgeInsets.only(top: 10),
              height: 10,
              width: 150,
              child: SvgPicture.asset(Images.underlineItem)),
        ],
      ),
    );
  }

  Widget commentFonts({
    String? strName,
    int? scountLike,
    String? strComment,
    double? width,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
                child: SvgPicture.asset(Images.notificationIcon1), radius: 17)),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.tabActiveColor),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(strName ?? '', style: TextStyles.textNotoSanBold(16)),
                    SizedBox(height: 10),
                    Text(strComment ?? '',
                        style: TextStyles.textNotoSanMedium(14)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(IconConstant.statusHeathIcon),
                    SizedBox(height: 9),
                    Text(
                      '${scountLike.toString()} lượt thích',
                      style: TextStyles.textNotoSanMedium(12),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buttonCommon({
    Widget? textIcon,
    VoidCallback? callBack,
    bool colors = true,
    double height = 50,
    Color color = Colors.transparent,
    double border = 15
  }) {
    return GestureDetector(
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color:colors?CustomColors.tabActiveColor:CustomColors.pinkColor,
            borderRadius: BorderRadius.circular(border),
          border: Border.all(color: color, width: 0.8)
        ),
        child: Center(
          child: textIcon,
        ),
      ),
      onTap: () {
        callBack!();
      },
    );
  }

  Widget gradient_text(
    String text, {
    TextStyle? style,
    required Gradient gradient,
  }) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }

  Widget logoScreen() {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(Images.logoImage2),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(bottom: 140, right: 10),
              child: SvgPicture.asset(Images.logoImage1),
            ),
          )
        ],
      ),
    );
  }

  Widget dayItem({
    String? strDay,
    String? strThu,
  }) {
    return Center(
        child: Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(right: 3),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          color: CustomColors.tabActiveColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            strDay ?? '',
            style: TextStyles.textNotoSanBold(25),
          ),
          SizedBox(height: 12),
          Text(
            strThu ?? '',
            style: TextStyles.textNotoSanMedium(15),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }

  void showToastSuccess(String str) {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white,
        textColor: Colors.blue,
        fontSize: 18.0
    );
  }
}
