import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:school_app/utilities/text_styles.dart';



class InformationProfileScreen extends StatefulWidget {
  const InformationProfileScreen({Key? key}) : super(key: key);

  @override
  State<InformationProfileScreen> createState() => _InformationProfileScreenState();
}

class _InformationProfileScreenState extends State<InformationProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarCommonV1(context,strTitle: 'Thông tin cá nhân' ),
      body: SafeArea(
        child: SingleChildScrollView(
      child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: CustomColors.greenColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                child: Stack(
                  children: [
                    Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 70,
                        width: 70,
                        child: SvgPicture.asset(Images.notificationIcon2)),
                  ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Common().buttonCommon(
                            textIcon: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(width: 25,),
                                Text('Đổi thông tin cá nhân',style: TextStyles.textPoppinMedium(20),textAlign: TextAlign.start,)
                              ],
                            ),
                            height: 65,
                            colorBorder: CustomColors.purpleColor,
                            callBack: ()=>NavigatorUtils.push(context, RouterGenerator.routeChangeInformationProfile)
                          ),
                          SizedBox(height: 15),
                          Common().buttonCommon(
                              textIcon: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(width: 25,),
                                  Text('Đổi mật khẩu',style: TextStyles.textPoppinMedium(20),textAlign: TextAlign.start,)
                                ],
                              ),
                              height: 65,
                              colorBorder: CustomColors.purpleColor,
                            callBack: ()=>NavigatorUtils.push(context, RouterGenerator.routeChangePassword)
                          ),
                          SizedBox(height: 15),
                          Common().buttonCommon(
                              textIcon: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(width: 25,),
                                  Text('Đăng xuất',style: TextStyles.textPoppinMedium(20),textAlign: TextAlign.start,)
                                ],
                              ),
                              height: 65,
                              colorBorder: CustomColors.purpleColor,
                            callBack: ()=>Navigator.pop(context),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
        ),
      ),
      ),
    );
  }
}
