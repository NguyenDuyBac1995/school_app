
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/core/models/student_model.dart';
import 'package:school_app/features/home/screens/home_screen.dart';
import 'package:school_app/features/home/screens/teacher_home_screen.dart';
import 'package:school_app/features/infomation_profile/screens/change_information_profile_screen.dart';
import 'package:school_app/features/infomation_profile/screens/change_password_screen.dart';
import 'package:school_app/features/infomation_profile/screens/information_profile_screen.dart';
import 'package:school_app/features/list_student_profile/screen/list_student_attendance_screen.dart';
import 'package:school_app/features/list_student_profile/screen/list_student_screen.dart';
import 'package:school_app/features/list_student_profile/screen/student_information_screen.dart';
import 'package:school_app/features/login/screen/login_screen.dart';
import 'package:school_app/features/main/screens/main_screen.dart';
import 'package:school_app/features/remind/screens/create_new_remind_screen.dart';
import 'package:school_app/features/remind/screens/remind_detail_screen.dart';
import 'package:school_app/features/remind/screens/remind_list_screen.dart';
import 'package:school_app/features/remind/screens/remind_screen.dart';
import 'package:school_app/features/school_class/screens/create_posts_screen.dart';
import 'package:school_app/features/splash/screens/splash_screen.dart';
import 'package:school_app/routers/app_router_name.dart';

import '../features/school_class/screens/school_class_screen.dart';

const String routeLoginScreen = '/login';
const String routeMainScreen = '/main';
const String routeSplashScreen = '/splash';
const String routeHome = '/home';
const String routeTeacherHome = '/teacherHome';
const String routeStudentInformation = 'student';
const String routeStudentDetail = 'studentDetail';
const String routeRemind = '/remind';
const String routeRemindList = 'remindList';
const String routeRemindDetail = 'remindDetail';
const String routeCreateNewRemind = 'createNewRemind';
const String routeInformationProfile = '/informationProfile';
const String routeChangeInformationProfile = 'changeInformationProfile';
const String routeChangePassword = 'changePassword';
const String routeListStudentScreen = 'listStudent';
const String routeStudentAttendance = 'studentAttendance';
const String routeCreatePosts = 'createPosts';
const String routeSchoolClassScreen = '/schoolClassScreen';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: routeSplashScreen, routes: [
    GoRoute(
        name: AppRouterName.splashRouter,
        path: routeSplashScreen,
        pageBuilder: (context, state) =>
            const CupertinoPage(child: SplashScreen())),
    GoRoute(
        name: AppRouterName.loginRouter,
        path: routeLoginScreen,
        pageBuilder: (context, state) =>
            const CupertinoPage(child: LoginScreen())),
    ShellRoute(
      builder: (context, state, child) => MainScreen(
        child: child,
      ),
      routes: [
        GoRoute(
            name: AppRouterName.homeRouter,
            path: routeHome,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
            routes: [
              GoRoute(
                name: AppRouterName.studentInformationRouter,
                path: routeStudentInformation,
                pageBuilder: (context, state) {
                  StudentModel data = state.extra as StudentModel;
                  return NoTransitionPage(
                      child: StudentInformationScreen(
                    data: data,
                  ));
                },
              ),
            ]),
        GoRoute(
            name: AppRouterName.teacherHomeRouter,
            path: routeTeacherHome,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: TeacherHomeScreen());
            },
            routes: [
              GoRoute(
                  name: AppRouterName.listStudentRouter,
                  path: routeListStudentScreen,
                  builder: (context, state) {
                    DataBundle data = state.extra as DataBundle;
                    return ListStudentScreen(
                      data: data.listData,
                    );
                  },
                  routes: [
                    GoRoute(
                      name: AppRouterName.studentDetailRouter,
                      path: routeStudentDetail,
                      pageBuilder: (context, state) {
                        DataBundle data = state.extra as DataBundle;
                        return NoTransitionPage(
                            child: StudentInformationScreen(
                          data: data.data,
                        ));
                      },
                    ),
                    GoRoute(
                        name: AppRouterName.liststudentAttendanceRouter,
                        path: routeStudentAttendance,
                        pageBuilder: (context, state) {
                          DataBundle data = state.extra as DataBundle;
                          return NoTransitionPage(
                              child: StudentAttendanceScreen(
                            data: data.listData,
                          ));
                        })
                  ]),
            ]),
        GoRoute(
            name: AppRouterName.schoolClassRouter,
            path: routeSchoolClassScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SchoolClassScreen()),
          routes: [
            GoRoute(
              name: AppRouterName.createPostRouter,
                path: routeCreatePosts,
              pageBuilder: (context, state)=> const NoTransitionPage(child: CreatePostsScreen())
            )
          ]
        ),
        GoRoute(
            name: AppRouterName.remindRouter,
            path: routeRemind,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: RemindScreen()),
            routes: [
              GoRoute(
                  name: AppRouterName.remindListRouter,
                  path: routeRemindList,
                  pageBuilder: (context, state) {
                    DataBundle data = state.extra as DataBundle;
                    return NoTransitionPage(
                        child: RemindListScreen(
                      data: data.listData,
                    ));
                  },
                  routes: [
                    GoRoute(
                        name: AppRouterName.remindDetailRouter,
                        path: routeRemindDetail,
                        pageBuilder: (context, state) {
                          DataBundle data = state.extra as DataBundle;
                          return NoTransitionPage(
                            child: RemindDetailScreen(data: data.data,),
                          );
                        },
                        routes: [
                          GoRoute(
                            name: AppRouterName.createRemindRouter,
                            path: routeCreateNewRemind,
                            pageBuilder: (context, state) =>
                                const NoTransitionPage(
                                    child: CreateNewRemindScreen()),
                          )
                        ])
                  ])
            ]),
        GoRoute(
            name: AppRouterName.infomationProfileRouter,
            path: routeInformationProfile,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: InformationProfileScreen()),
            routes: [
              GoRoute(
                  name: AppRouterName.changeInformation,
                  path: routeChangeInformationProfile,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: ChangeInformationScreen())),
              GoRoute(
                  name: AppRouterName.changePasswordRouter,
                  path: routeChangePassword,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: ChangePasswordScreen()))
            ])
      ],
    )
  ]);
}
