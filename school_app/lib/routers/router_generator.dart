import 'package:flutter/material.dart';
import 'package:school_app/features/infomation_profile/screens/change_information_profile_screen.dart';
import 'package:school_app/features/infomation_profile/screens/change_password_screen.dart';
import 'package:school_app/features/login/screen/login_screen.dart';
import 'package:school_app/features/main/screens/main_screen.dart';
import 'package:school_app/features/remind/screens/remind_detail_screen.dart';
import 'package:school_app/features/remind/screens/remind_list_screen.dart';
import 'package:school_app/features/remind/screens/remind_screen.dart';
import 'package:school_app/features/splash/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_app/features/teacher_route/list_student_screen.dart';
import 'package:school_app/features/teacher_route/student_attendance_screen.dart';
import '../core/models/data_bundle.dart';
import '../features/student_profile/student_information_screen.dart';
import '../features/remind/screens/create_new_remind_screen.dart';
import '404.dart';

class RouterGenerator {
  // Router List
  static const routeLoginScreen = '/login';
  static const routeMainScreen = '/main';
  static const routeSplashScreen = '/splash';
  static const routeStudentInformation = '/student';
  static const routeRemind = '/remind';
  static const routeRemindList = '/remindList';
  static const routeRemindDetail = '/remindDetail';
  static const routeCreateNewRemind = '/createNewRemind';
  static const routeInformationProfile = '/informationProfile';
  static const routeChangeInformationProfile = '/changeInformationProfile';
  static const routeChangePassword = '/changePassword';
  static const routeListStudentScreen = '/listStudent';
  static const routeStudentAttendance = '/studentAttendance';

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
      case routeRemindList:
        if (args is DataBundle) {
          return MaterialPageRoute(
              builder: (_) => RemindListScreen(data: args.data!));
        }
        break;
      case routeRemindDetail:
        if (args is DataBundle) {
          return MaterialPageRoute(
              builder: (_) => RemindDetailScreen(data: args.data!));
        }
        break;
      case routeCreateNewRemind:
        if(args is DataBundle){
          return MaterialPageRoute(
              builder: (_)=>CreateNewRemindScreen(data: args.data!,));
        }
        break;
      case routeChangeInformationProfile:
        return MaterialPageRoute(builder: (_)=>ChangeInformationScreen());
      case routeChangePassword:
        return MaterialPageRoute(builder: (_)=> ChangePasswordScreen());
      case routeListStudentScreen:
        if(args is DataBundle){
          return MaterialPageRoute(
              builder: (_) =>ListStudentScreen(data: args.data!,));
        }
        break;
      case routeStudentAttendance:
        if(args is DataBundle){
          return MaterialPageRoute(
              builder: (_) =>StudentAttendanceScreen(data: args.data!,));
        }
        break;
      default:
        break;
    }
    return MaterialPageRoute(builder: (_) => WidgetNotFound());
  }
}
