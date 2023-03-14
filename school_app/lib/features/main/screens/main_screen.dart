import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/enums/tabs_enum.dart';
import 'package:school_app/features/home/screens/home_screen.dart';
import 'package:school_app/features/infomation_profile//screens/information_profile_screen.dart';
import 'package:school_app/features/main/blocs/main_bloc.dart';
import 'package:school_app/features/school_class/screens/school_class_screen.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/background_container.dart';

import '../../remind/screens/remind_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int activeIndex = 0 ;
  void changeActivePage(int index){
    setState(() {
      activeIndex = index ;
    });
  }
  final List<Widget> _listScreen = [];
  var _selectedTab = TabsList.schoolHome;
  @override
  Widget build(BuildContext context) {
    _listScreen.clear();
    _listScreen.add(const HomeScreen());
    _listScreen.add(const SchoolClassScreen());
    _listScreen.add(const RemindScreen());
    _listScreen.add(const InformationProfileScreen());

    return BlocBuilder<MainBloc, MainState>(builder: ((context,state) {
      return MainContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body: _listScreen[state.selectedTab],
            bottomNavigationBar: _bottomNavigationBar),
      );
    }));
  }

  Widget get _bottomNavigationBar {
    return BlocBuilder<MainBloc, MainState>(builder: ((context,state) {
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
          currentIndex: state.selectedTab,
          onTap: (int i) {
            context.read<MainBloc>().add(TabChanged(selectedTab: i));
          },
          selectedItemColor: CustomColors.yellowColor,
          showUnselectedLabels: true);
    }));
  }

  Future<void> _handleTabChanged(int i) async {
    setState(() {
      _selectedTab = TabsList.values[i];
    });
  }
}
