import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/features/home/blocs/home_bloc.dart';
import 'package:school_app/features/home/screens/test.dart';
import 'package:school_app/routers/app_router_name.dart';

import '../../../core/models/data_bundle.dart';
import '../../../utilities/assets_common.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/common.dart';
import '../../../utilities/string.dart';
import '../../../widgets/appbar/app_bar.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/home/notification.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context,
            strTitle: 'Trường mầm non xxxx', icon: false),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, state) {
            if(state.loading == true){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if (state.error != null){
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  NotificationCommon(context, strContent: Strings.NOTIFICATION),
                  ...state.listClass!
                      .asMap()
                      .map((key, item) => MapEntry(
                      key,
                      SizedBox(
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Common().homeItemStudent(
                              name: item,
                              className: '${state.listStudentClass![key].length.toString()} học sinh',
                              avatarAssets: Images.avatarClass,
                            ),
                            SizedBox(
                              height: 190,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      child: const BoxItemHome(
                                        strIcon: Images.homeItemLeft,
                                        content: 'Danh sách học sinh',
                                        backgroundColor: CustomColors.pinkColor,
                                        textColor: Colors.white,
                                        widthBox: 180,
                                      ),
                                    ),
                                    onTap: () {
                                      DataBundle data = DataBundle(listData: state.listStudentClass![key]);
                                      context.goNamed(AppRouterName.listStudentRouter,extra: data);
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const MyTest()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      child: const BoxItemHome(
                                        strIcon: Images.homeItemRight,
                                        content: 'Nhóm lớp',
                                        backgroundColor: CustomColors.yellowColor,
                                        textColor: CustomColors.purpleColor,
                                        widthBox: 180,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const CustomUnderline(),
                          ],
                        ),
                      )))
                      .values
                      .toList()
                ],
              ),
            );
          },
        )
    );
  }
}
