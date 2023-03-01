import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/utils/text_styles.dart';

import '../assets.dart';

class Common {
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

  TextFormField textFieldLogin({
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
          hintStyle: TextStyles.textPoppinSize15,
          labelStyle: TextStyles.textPoppinSize15,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.textColor),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.textColor),
              borderRadius: BorderRadius.circular(15))),
    );
  }

  Widget glassContainer() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey.withOpacity(0.3),
              Colors.grey.withOpacity(0.3)
            ],
            stops: const [
              0.0,
              1.0
            ]),
      ),
    );
  }

  Widget homeItemStudent(
      {String? name,
      String? className,
      String? teacherName,
      String? imageAssets,
      String? itemName,
      double? width,
      double? height,
        Function? callBackLeft,
        Function? callBackRight,
      }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      width: width,
      height: height,
      child: Column(
        children: [
          SizedBox(height: 7),
          Row(
            children: [
              CircleAvatar(child: SvgPicture.asset(imageAssets!), radius: 32),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? '',
                    style: TextStyles.textSizeBold14,
                  ),
                  SizedBox(height: 12),
                  Text(
                    className ?? '',
                    style: TextStyles.textSize12,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Cô $teacherName",
                    style: TextStyles.textSize12,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  height: 165,
                  width: 170,
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
                      SizedBox(height: 20),
                      Text(itemName ?? '',
                          style: TextStyles.textSizeBold14.copyWith(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                onTap: (){
                  callBackLeft!();
                },
              ),
              GestureDetector(
                child: Container(
                  height: 165,
                  width: 170,
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
                      Text( 'Nhóm lớp',
                          style: TextStyles.textSizeBold14
                          ),
                    ],
                  ),
                ),
                onTap: (){
                  callBackRight!();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget commentFonts(
  {String? strName,
    int? scountLike,
    String? strComment,
    double? width,
}
      ){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(child: SvgPicture.asset(Images.notificationIcon1),radius: 17)),
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.tabActiveColor
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(strName??'', style: TextStyles.textNotoSizeBold16),
                  SizedBox(height: 10),
                  Text(strComment??'', style: TextStyles.textNotoSize14),
                ],
              ),
              Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIcon(IconConstant.statusHeathIcon),
                  SizedBox(height: 9),
                  Text('${scountLike.toString()} lượt thích', style: TextStyles.textNotoSize12,)
                ],
              )
            ],
          ),
        ),
      )
    ],
    );
  }

  Widget buttonCommon ({
  Widget? textIcon,
    VoidCallback? callBack,
}){
   return GestureDetector(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: CustomColors.tabActiveColor,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: textIcon,
        ),
      ),
      onTap: (){
        callBack!();
      },
    );
  }
}