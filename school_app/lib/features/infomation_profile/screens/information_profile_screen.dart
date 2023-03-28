import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/routers/app_router_name.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
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
      child: Stack(
        children: [
          Container(
            height: 460,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: CustomColors.greenColor,
                borderRadius: BorderRadius.circular(14),
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Common().buttonCommon(
                        textIcon: Row(
                          children: [
                            const SizedBox(width: 25,),
                            Text('Đổi thông tin cá nhân',style: TextStyles.textPoppinMedium(20),textAlign: TextAlign.start,)
                          ],
                        ),
                        height: 65,
                        colorBorder: CustomColors.purpleColor,
                        callBack: ()=>context.goNamed(AppRouterName.changeInformation)
                      ),
                      const SizedBox(height: 15),
                      Common().buttonCommon(
                          textIcon: Row(
                            children: [
                              const SizedBox(width: 25,),
                              Text('Đổi mật khẩu',style: TextStyles.textPoppinMedium(20),textAlign: TextAlign.start,)
                            ],
                          ),
                          height: 65,
                          colorBorder: CustomColors.purpleColor,
                        callBack: ()=>context.goNamed(AppRouterName.changePasswordRouter)
                      ),
                      const SizedBox(height: 15),
                      Common().buttonCommon(
                          textIcon: Row(
                            children: [
                              const SizedBox(width: 25,),
                              Text('Đăng xuất',style: TextStyles.textPoppinMedium(20),textAlign: TextAlign.start,)
                            ],
                          ),
                          height: 65,
                          colorBorder: CustomColors.purpleColor,
                        callBack: ()=>Navigator.pop(context),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 70,
                    width: 70,
                    child: SvgPicture.asset(Images.notificationIcon2)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(right: 5, top: 10),
              child: Transform.scale(scale: 1.15,
                  child: SvgPicture.asset(Images.notificationIcon1)),
            ),
          ),
        ],
      ),
      ),
      ),
    );
  }
}
