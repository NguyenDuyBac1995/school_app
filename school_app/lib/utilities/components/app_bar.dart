import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/utilities/assets.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/utilities/text_styles.dart';

PreferredSize appBarCommonV1(
  BuildContext context, {
  String? strTitle,
  bool icon = true,
  bool backgroundColor = false,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(15, 49, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon
                      ? IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: CustomColors.textColor,
                          ))
                      : IconButton(
                          icon: SvgPicture.asset(IconConstant.arrowDownIcon),
                          onPressed: () {},
                        ),
                  Text(strTitle ?? '', style: TextStyles.textSize20),
                ],
              ),
              Transform.scale(
                  scale: 1.2,
                  child: SvgPicture.asset(IconConstant.notificationIcon))
            ],
          ),
        ),
      ],
    ),
  );
}
