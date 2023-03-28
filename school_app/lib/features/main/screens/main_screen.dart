import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/enums/tabs_enum.dart';
import 'package:school_app/features/home/screens/home_screen.dart';
import 'package:school_app/features/home/screens/teacher_home_screen.dart';
import 'package:school_app/features/infomation_profile//screens/information_profile_screen.dart';
import 'package:school_app/features/login/blocs/login_bloc.dart';
import 'package:school_app/features/main/blocs/main_bloc.dart';
import 'package:school_app/features/school_class/screens/school_class_screen.dart';
import 'package:school_app/routers/app_router.dart';
import 'package:school_app/routers/app_router_name.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/background_container.dart';

import '../../remind/screens/remind_screen.dart';
import '../../remind/screens/remind_student_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.child});

  final Widget? child;
  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int activeIndex = 0 ;
  // void changeActivePage(int index){
  //   setState(() {
  //     activeIndex = index ;
  //   });
  // }
  final List<Widget> _listScreenStudent = [const HomeScreen(),const SchoolClassScreen(),const RemindStudentScreen(),const InformationProfileScreen()];
  final List<Widget> _listScreenTeacher = [const TeacherHomeScreen(),const SchoolClassScreen(),const RemindScreen(),const InformationProfileScreen()];
  @override
  Widget build(BuildContext context) {
    // _listScreen.clear();
    // _listScreen.add(const HomeScreen());
    // _listScreen.add(const SchoolClassScreen());
    // _listScreen.add(const RemindScreen());
    // _listScreen.add(const InformationProfileScreen());


    return BlocBuilder<MainBloc, MainState>(builder: ((context,parentstate) {
      return MainContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body:
            // BlocBuilder<LoginBloc, LoginState>(
            //   builder: (context, childstate){
            //     if( childstate.selectedRoad == 1){
            //       return _listScreenStudent[parentstate.selectedTab];
            //     }
            //     return _listScreenTeacher[parentstate.selectedTab];
            //   },
            // ),
            BlocBuilder<LoginBloc, LoginState>(builder: (context, childState){
              return WillPopScope(
                  onWillPop: ()async{
                    final String location = GoRouterState.of(context).location;
                    if(childState.selectedRoad == 1){
                      if(!location.startsWith(routeHome)){
                        _onItemTapped(context, 0);
                      }
                    }else{
                      if(location.startsWith(routeTeacherHome)){
                        _onItemTapped(context, 0);
                      }
                    }
                    return true;
                  },
                  child: widget.child!);
            }),
            bottomNavigationBar: _bottomNavigationBar),
      );
    }));
  }

  Widget get _bottomNavigationBar {
    return BlocBuilder<MainBloc, MainState>(builder: ((context,state) {
      return BlocBuilder<LoginBloc, LoginState>(builder: (context, childstate){
        return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: CustomIcon(
                  IconConstant.homeIcon,
                  color: state.selectedTab == TabsList.schoolHome.index
                      ? CustomColors.yellowColor
                      : Colors.white,
                ),
                label: 'Trang chủ',
                backgroundColor: CustomColors.greenColor,
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  IconConstant.groupPeopleIcon,
                  color: state.selectedTab == TabsList.schoolClass.index
                      ? CustomColors.yellowColor
                      : Colors.white,
                ),
                label: 'Lớp học',
                backgroundColor: CustomColors.greenColor,
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  IconConstant.feedListIcon,
                  color: state.selectedTab == TabsList.schoolRemind.index
                      ? CustomColors.yellowColor
                      : Colors.white,
                ),
                label: 'Nhắc nhở',
                backgroundColor: CustomColors.greenColor,
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(
                  IconConstant.profileIcon,
                  color: state.selectedTab == TabsList.profile.index
                      ? CustomColors.yellowColor
                      : Colors.white,
                ),
                label: 'Cá nhân',
                backgroundColor: CustomColors.greenColor,
              ),
            ],
            onTap: (int index) {
              _onItemTapped(context, index,role: childstate.selectedRoad);
              context.read<MainBloc>().add(TabChanged(selectedTab: index));
            },
            currentIndex: _getSelectedIndex(context),
            // currentIndex: state.selectedTab,
            selectedItemColor: CustomColors.yellowColor,
            showUnselectedLabels: true
        );
      });
    }));
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    print('$location');
    if(location.startsWith(routeHome)){
      return 0;
    }
    if(location.startsWith(routeSchoolClassScreen)){
      return 1;
    }
    if(location.startsWith(routeRemind)){
      return 2;
    }
    if(location.startsWith(routeInformationProfile)){
      return 3;
    }
    return 0;
  }

  void _onItemTapped(BuildContext context, int index,{int? role}) {
    if(role == 1){
      switch (index){
        case 0:
          context.goNamed(AppRouterName.homeRouter);
          break;
        case 1:
          context.goNamed(AppRouterName.schoolClassRouter);
          break;
        case 2:
          context.goNamed(AppRouterName.remindRouter);
          break;
        case 3:
          context.goNamed(AppRouterName.infomationProfileRouter);
          break;
      }
    }
    else{
      switch (index){
        case 0:
          context.goNamed(AppRouterName.teacherHomeRouter);
          break;
        case 1:
          context.goNamed(AppRouterName.schoolClassRouter);
          break;
        case 2:
          context.goNamed(AppRouterName.remindRouter);
          break;
        case 3:
          context.goNamed(AppRouterName.infomationProfileRouter);
          break;
      }
    }
  }
}

