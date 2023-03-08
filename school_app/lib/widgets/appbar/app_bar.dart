import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/common_widget.dart';
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
        const Expanded(child: SizedBox()),
        Container(
          padding: EdgeInsets.fromLTRB(12,0, 20, 0),
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
                            color: CustomColors.purpleColor,
                          ))
                      : IconButton(
                          icon: SvgPicture.asset(IconConstant.arrowDownIcon),
                          onPressed: () {},
                        ),
                  Text(strTitle ?? '', style: TextStyles.textInterBold(21), overflow: TextOverflow.ellipsis ,),
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
