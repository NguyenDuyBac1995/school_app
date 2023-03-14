import 'package:flutter/material.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/features/remind/screens/test.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/widgets/home/box_item.dart';
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
    appBar: appBarCommonV1(context, strTitle: 'Trường mầm non xxxx', icon: false ),
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          NotificationCommon(context,strContent: Strings.NOTIFICATION),
          ...dummyData.asMap().map((key, item) => MapEntry(key, Container(
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Common().homeItemStudent(
                  name: item.name,
                  teacherName: item.teacher,
                  className: item.class_studen,
                  avatarAssets: item.avata,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: BoxItemHome(
                        strIcon: Images.homeItemLeft,
                        content: 'Hồ sơ học sinh',
                        backgroundColor: CustomColors.pinkColor,
                        textColor: Colors.white,
                        widthBox: 180,
                      ),
                      onTap: (){
                        var data = DataBundle(
                            data: item
                        );
                        if(dummyData[0] == item)
                        {NavigatorUtils.push(context,RouterGenerator.routeStudentInformation,data: data );}
                        else{
                          NavigatorUtils.push(context, RouterGenerator.routeListStudentScreen, data: data);}
                      },
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> TestDateTime()));
                      },
                      child: BoxItemHome(
                        strIcon: Images.homeItemRight,
                        content: 'Nhóm lớp',
                        backgroundColor: CustomColors.yellowColor,
                        textColor: CustomColors.purpleColor,
                        widthBox: 180,
                      ),
                    )],
                ),
                Common().underLine(
                    color: CustomColors.purpleColor,
                    width: MediaQuery.of(context).size.width*0.4
                )
              ],
            ),
          ))).values.toList()
        ],
      ),
    )
    );
  }
}
