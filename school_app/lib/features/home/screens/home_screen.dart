import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/utilities/dummy_data.dart';
import '../../../utilities/assets.dart';
import '../../../utilities/components/app_bar.dart';
import '../../../utilities/notification/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarCommonV1(context, strTitle: 'Trường mầm non xxxx', icon: false ),
        body: Stack(
          children: [
            Common().logoScreen(),
            Column(
              children: [
                NotificationScreen(),
                Expanded(
                  child: ListView.separated(
                    itemCount: dummyData.length,
                    itemBuilder: (BuildContext context, index){
                      return Common().homeItemStudent(
                        name: dummyData[index].name,
                        teacherName: dummyData[index].teacher,
                        className: dummyData[index].class_studen,
                        imageAssets: dummyData[index].avata,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.35,
                        itemName: 'Hồ sơ học sinh',
                        callBackLeft : (){
                          Student data = dummyData[index];
                          NavigatorUtils.push(context, RouterGenerator.routeStudentInformation,data: data);
                        }
                      );
                    },
                    separatorBuilder: (context,index){
                      return Container(
                          height: 10,
                          width: 150,
                          child: SvgPicture.asset(Images.underlineItem));
                    },
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}