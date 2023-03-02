import 'package:flutter/material.dart';
import 'package:school_app/features/login/screen/login_screen.dart';
import 'package:school_app/features/main/screens/main_screen.dart';
import 'package:school_app/features/remind/screens/remind_detail_screen.dart';
import 'package:school_app/features/remind/screens/remind_screen.dart';
import 'package:school_app/features/splash/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../core/models/data_bundle.dart';
import '../features/infomation_profile/screens/student_information_screen.dart';
import '404.dart';

class RouterGenerator {
  // Router List
  static const routeLoginScreen = '/login';
  static const routeMainScreen = '/main';
  static const routeSplashScreen = '/splash';
  static const routeStudentInformation = '/student';
  static const routeRemind = '/remind';
  static const routeRemindDetail = '/remindDetail';
  static const routeInformationProfile = '/informationProfile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case routeSplashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
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
        if(args is DataBundle){
          return MaterialPageRoute(builder: (_) => StudentInformationScreen(data: args.data,));
        }
        break;
      case routeRemind:
        return MaterialPageRoute(builder: (_) => RemindScreen());
      case routeRemindDetail:
        if (args is DataBundle) {
          return MaterialPageRoute(
              builder: (_) => RemindDetailScreen(data: args.data!));
        }
        break;

      default:
        break;
    }
    return MaterialPageRoute(builder: (_) => WidgetNotFound());
  }
}
