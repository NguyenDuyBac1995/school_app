import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/core/models/student_model.dart';
import 'package:school_app/features/home/screens/test.dart';
import 'package:school_app/features/login/blocs/login_bloc.dart';
import 'package:school_app/routers/app_router_name.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:school_app/widgets/home/notification.dart';
import 'package:school_app/utilities/string.dart';
import '../../../utilities/assets_common.dart';
import '../../../widgets/appbar/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context,
            strTitle: 'Trường mầm non xx', icon: false),
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, state) {
            if(state.loading == true){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state.error != null){
              return Center(
                child: Text(state.error??''),
              );
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  NotificationCommon(context, strContent: Strings.NOTIFICATION),
                  ...state.listStudent!
                      .asMap()
                      .map((key, item) => MapEntry(
                      key,
                      SizedBox(
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Common().homeItemStudent(
                              name: item.name,
                              teacherName: 'Cô ${item.teacherName}',
                              className: item.className,
                              avatarAssets: item.avata,
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
                                        content: 'Hồ sơ học sinh',
                                        backgroundColor: CustomColors.pinkColor,
                                        textColor: Colors.white,
                                        widthBox: 180,
                                      ),
                                    ),
                                    onTap: () {
                                      StudentModel data = item;
                                      context.goNamed(AppRouterName.studentInformationRouter, extra: data);
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
