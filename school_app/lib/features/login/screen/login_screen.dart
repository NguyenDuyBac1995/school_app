import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/components/common_font.dart';

import '../../../utilities/assets.dart';
import '../../../utilities/utils/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textUserController = TextEditingController();
  final _textPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Common().logoScreen(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                constraints: BoxConstraints.expand(),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 300,
                            width: 280,
                            child: SvgPicture.asset(
                              Images.splashImage,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(height: 35),
                          Text(
                            "Đăng Nhập", style: TextStyles.textSize34,
                          ),
                          SizedBox(height: 26),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Common().textFieldLogin(
                          textStyle: TextStyles.textSize16,
                            controller: _textUserController,
                            hintvalue: 'Số điện thoại'),
                        SizedBox(height: 15),
                        Common().textFieldLogin(
                            textStyle: TextStyles.textSize16,
                            controller: _textPasswordController,
                            obscureText: true,
                            suffixIcons: true,
                            hintvalue: 'Mật khẩu'),
                        SizedBox(height: 30),
                        Common().buttonCommon(
                            textIcon: Text('Đăng nhập', style: TextStyles.textNotoSize14,),
                          callBack: (){

                              NavigatorUtils.push(context, RouterGenerator.routeMainScreen);
                          }
                        )
                      ],
                    )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}