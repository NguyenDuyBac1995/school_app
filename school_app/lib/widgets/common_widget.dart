import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/text_styles.dart';

import '../utilities/assets_common.dart';
import '../utilities/custom_styles.dart';

class Common {
  Widget homeItemStudent({
    String? name,
    String? className,
    String? teacherName,
    String? avatarAssets,
    Widget? suffixIcon,
    bool subTitle = true,
    String? text ,
  }) {
    return
        ListTile(
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
              child: CircleAvatar(child: CustomIcon(avatarAssets!, size: 50), backgroundColor: Colors.blue, radius: 30,)),
          title: Padding(
            padding: EdgeInsets.only(bottom: 11),
            child: Text(
              name ?? '',
              style: TextStyles.textInterBold(17),
            ),
          ),
          subtitle: subTitle?Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Text(
              className ?? '',
              style: TextStyles.textInterMedium(14),
            ),
              SizedBox(height: 4),
              Text(
                "Cô $teacherName",
                style: TextStyles.textInterMedium(14),
              )
            ],
          ):Text(
            text ?? '',
            style: TextStyles.textInterMedium(14),
          ),
          trailing: suffixIcon,

        );
  }

  Widget profileItemCommon (
      String? strTitle,
      TextEditingController controller,
      ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(strTitle??'', style: TextStyles.textInterMedium(18),)),
        Expanded(
          flex: 2,
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child:TextFormField(
                controller: controller,
                style: TextStyles.textInterMedium(16),
                validator: (value)=>value!.isEmpty?'Hãy nhập thông tin đầy đủ': null,
                decoration: CustomStyles.inputDecorationBorder(
                    borderColor: CustomColors.purpleColor,
                    paddingSize: 12
                ),
              )
          ),
        ),
      ],
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
                color: CustomColors.yellowColor),
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

  Widget underLine ({
  Color color = CustomColors.purpleColor,
    double? width,
}){
    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(
              child: Container(
                  color:color, height: 1)),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.white, width: 2)),
          ),
          Expanded(
              child: Container(
                  color: color, height: 1)),
        ],
      ),
    );
  }

  Widget buttonCommon({
    Widget? textIcon,
    VoidCallback? callBack,
    Color colors = CustomColors.yellowColor,
    double height = 50,
    Color colorBorder = Colors.transparent,
    double border = 15
  }) {
    return GestureDetector(
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(border),
          border: Border.all(color: colorBorder, width: 0.8)
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


  Widget logoScreen({
    double? width
}) {
    return Container(
      child: Stack(
        children: [
         Align(
           alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(Images.logoImage2),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(bottom: 140,right: 10),
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
          color: CustomColors.yellowColor,
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
