import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/routers/app_router_name.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/background_container.dart';
import '../../../routers/fluro_navigator.dart';
import '../../../routers/router_generator.dart';
import '../../../widgets/logo_school/logo_school.dart';

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
    Timer(const Duration(seconds: 3), () {
      // NavigatorUtils.push(context, RouterGenerator.routeLoginScreen);
      context.goNamed(AppRouterName.loginRouter);
    });
  }


  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child:Container(
            constraints: const BoxConstraints.expand(),
            child: orientation == Orientation.portrait ?
                Align(
                  alignment: const Alignment(0.0,-0.6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      GetLogo(),
                      SplashText()
                    ],
                  ),
                ):
                Row(
                  children: const [
                    Expanded(child: GetLogo()),
                    Expanded(child: SplashText()),
                  ],
                )
          ),
        ),
      ),
    );
  }
}

class SplashText extends StatelessWidget {
  const SplashText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FittedBox(
      child: FractionallySizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GradientText('Welcome to',
                style: TextStyle(fontSize: size.width*0.08, fontWeight: FontWeight.bold),
                gradient: LinearGradient(
                    colors: [
                      Colors.redAccent.shade400,
                      Colors.lightBlueAccent.shade200,
                      Colors.yellowAccent,
                    ]
                )),
            const SizedBox(height: 5,),
            GradientText('School',
                style: TextStyle(fontSize: size.width*0.12, fontWeight: FontWeight.bold),
                gradient: LinearGradient(
                    colors: [
                      Colors.redAccent.shade400,
                      Colors.lightBlueAccent.shade200,
                      Colors.yellowAccent,
                    ]
                )),
          ],
        ),
      ),
    );
  }
}
