import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/components/common_font.dart';
import '../../../routers/fluro_navigator.dart';
import '../../../routers/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () { NavigatorUtils.push(context, RouterGenerator.routeLoginScreen);});
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Common().logoScreen(),
            Container(
              constraints: BoxConstraints.expand(),
              child: Column(
                children: [
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 300,
                        width: 280,
                        child: SvgPicture.asset(Images.splashImage,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,),
                      ),
                      SizedBox(height: 25),
                      Common().gradient_text('Welcome to',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          gradient: LinearGradient(
                              colors: [
                                Colors.redAccent.shade400,
                                Colors.lightBlueAccent.shade200,
                                Colors.yellowAccent,
                              ]
                          ))
                    ],
                  ),),
                  Expanded(child:
                  Common().gradient_text('School',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      gradient: LinearGradient(
                          colors: [
                            Colors.redAccent.shade400,
                            Colors.lightBlueAccent.shade200,
                            Colors.yellowAccent,
                          ]
                      ))),
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}
