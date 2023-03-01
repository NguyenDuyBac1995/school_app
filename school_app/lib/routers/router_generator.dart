import 'package:flutter/material.dart';
import 'package:school_app/features/login/screen/login_screen.dart';
import 'package:school_app/features/main/screens/main_screen.dart';
import 'package:school_app/features/splash/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_app/features/student_infomation/student_information_screen.dart';
import 'package:school_app/utilities/dummy_data.dart';
import '404.dart';

class Bundol {
  Student data;
  Bundol({required this.data});
}

class RouterGenerator {
  // Router List
  static const routeLoginScreen = '/login';
  static const routeMainScreen = '/main';
  static const routeSplashScreen = '/splash';
  static const routeStudentInformation = '/student';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case routeSplashScreen:
        return MaterialPageRoute(builder: (_) => const  SplashScreen());
      case routeMainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case routeLoginScreen:
        return PageTransition(
            child: LoginScreen(),
          type: PageTransitionType.scale,
          alignment: Alignment.center,
          duration: Duration(seconds: 2),
        );
      case routeStudentInformation:

          return MaterialPageRoute(
              builder:(_)=>StudentInformationScreen() );

      default:
        break;
    }
    return MaterialPageRoute(builder:(_) => WidgetNotFound());
  }
}
