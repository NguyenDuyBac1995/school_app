import 'package:flutter/material.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/utilities/notification/notification.dart';
import 'package:school_app/utilities/string.dart';
import '../../../utilities/components/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context, strTitle: 'Trường mầm non xxxx', icon: false ),
      body: Stack(
        children: [
          Common().logoScreen(),
          ListView(
            children: [
              NotificationCommon(context,strContent: Strings.NOTIFICATION),
              ...dummyData.asMap().map((key, item) => MapEntry(key, Common().homeItemStudent(
                  name: item.name,
                  teacherName: item.teacher,
                  className: item.class_studen,
                  avatarAssets: item.avata,
                  width: MediaQuery.of(context).size.width,
                  height: 335,
                  itemName: 'Hồ sơ học sinh',
                  callBackLeft : (){
                    var data = DataBundle(data: item);
                    NavigatorUtils.push(context, RouterGenerator.routeStudentInformation,data: data);
                  }
              ))).values.toList()
            ],
          ),
        ],
      )
    );
  }
}
