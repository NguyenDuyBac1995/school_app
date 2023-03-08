import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/assets_common.dart';
import '../../utilities/colors.dart';
import '../../utilities/text_styles.dart';

Widget NotificationCommon(BuildContext context,{
  String? strContent
}){
  return Container(
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 40),
          decoration: BoxDecoration(
            color: CustomColors.greenColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                          padding: EdgeInsets.only(left: 60,top: 10, right: 10, bottom: 2),
                          child: CircleAvatar(backgroundColor: CustomColors.yellowColor,radius: 25)),
                      CircleAvatar(backgroundColor: CustomColors.yellowColor,radius: 15),
                      Padding(
                          padding: EdgeInsets.only(left: 10,top: 8),
                          child: CircleAvatar(backgroundColor: CustomColors.yellowColor,radius: 8)),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    height: 70,
                    width: 65,
                    child: SvgPicture.asset(Images.notificationIcon2)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(25, 15, 45, 40),
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
                              Text('Bảng tin',style: TextStyles.textInterBold(20)),
                            ],
                          ),
                          SizedBox(height: 17),
                          Container(
                            child: Text(strContent??'',
                              style: TextStyles.textInterMedium(16).copyWith(wordSpacing: 2),
                              overflow: TextOverflow.clip,
                            ),
                          )
                        ],
                      )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(onPressed: () {  }, child: Text('Xem thêm',
                      style: TextStyles.textInterMedium(12).copyWith(decoration: TextDecoration.underline, fontStyle: FontStyle.italic),
                    ), ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
              height: 10,
              width: 150,
              child: SvgPicture.asset(Images.underlineItem)),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.only(right: 5, top: 10),
            child: Transform.scale(scale: 1.15,
                child: SvgPicture.asset(Images.notificationIcon1)),
          ),
        ),
      ],
    ),
  );
}

