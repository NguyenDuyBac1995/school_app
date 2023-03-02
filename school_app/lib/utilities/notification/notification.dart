import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets_common.dart';
import '../colors.dart';
import '../text_styles.dart';

Widget NotificationCommon(BuildContext context,{
  String? strContent
}){
  return Stack(
    children: [
      Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.symmetric(vertical: 32,horizontal: 20),
        decoration: BoxDecoration(
          color: CustomColors.mainTabColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(left: 60,top: 10, right: 10, bottom: 2),
                        child: CircleAvatar(backgroundColor: CustomColors.tabActiveColor,radius: 25)),
                    CircleAvatar(backgroundColor: CustomColors.tabActiveColor,radius: 15),
                    Padding(
                        padding: EdgeInsets.only(left: 10,top: 8),
                        child: CircleAvatar(backgroundColor: CustomColors.tabActiveColor,radius: 8)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: 70,
                  width: 65,
                  child: SvgPicture.asset(Images.notificationIcon2)),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(25, 15, 45, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: 30,
                            width: 25,
                            child: SvgPicture.asset(Images.notificationIcon3)),
                        Text('Bảng tin',style: TextStyles.textSizeBold20),
                      ],
                    ),
                    SizedBox(height: 17),
                    Container(
                      child: Text(strContent??'',
                        style: TextStyles.textSize14,
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(onPressed: () {  }, child: Text('Xem thêm',
                  style: TextStyles.textSizeUnder12,
                ), ),
              ),
            )
          ],
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          child: Transform.scale(scale: 1.15,
              child: SvgPicture.asset(Images.notificationIcon1)),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 10,
            width: 150,
            child: SvgPicture.asset(Images.underlineItem)),
      )
    ],
  );
}

