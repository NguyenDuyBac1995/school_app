import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';
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
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child:Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width*0.6,
                      width: MediaQuery.of(context).size.width*0.6,
                      child: SvgPicture.asset(
                        Images.splashImage,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    GradientText('Welcome to',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        gradient: LinearGradient(
                            colors: [
                              Colors.redAccent.shade400,
                              Colors.lightBlueAccent.shade200,
                              Colors.yellowAccent,
                            ]
                        ))
                  ],
                ),
                SizedBox(height: 15,),
                GradientText('School',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    gradient: LinearGradient(
                        colors: [
                          Colors.redAccent.shade400,
                          Colors.lightBlueAccent.shade200,
                          Colors.yellowAccent,
                        ]
                    )),
              ],
            )
          )
        ),
      ),
    );
  }
}
