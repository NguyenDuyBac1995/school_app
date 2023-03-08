import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../../core/models/data_bundle.dart';
import '../../../utilities/assets_common.dart';
import '../../../data/dummy_data.dart';

class RemindScreen extends StatefulWidget {
  const RemindScreen({Key? key}) : super(key: key);

  @override
  State<RemindScreen> createState() => _RemindScreenState();
}

class _RemindScreenState extends State<RemindScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommonV1(context,strTitle: 'Nhắc nhở' ),
      body: SafeArea(
        child: Stack(
          children: [
            Common().logoScreen(),
            Container(
              child: Column(
                children: [
                  Expanded(
                      child:ListView.builder(
                          itemBuilder: (context, index){
                            return Container(
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Common().homeItemStudent(
                                  name: dummyData[index].name,
                                  className: dummyData[index].class_studen,
                                  teacherName: dummyData[index].teacher,
                                  avatarAssets: dummyData[index].avata,
                                  width: MediaQuery.of(context).size.width,
                                  callBack: (){
                                    var value = DataBundle(data: dummyData[index]);
                                    NavigatorUtils.push(context, RouterGenerator.routeRemindDetail,data: value);
                                  }
                              ),
                              Common().underLine(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  color: CustomColors.purpleColor
                              )
                                ]
                              ),
                            );
                          },
                          itemCount: dummyData.length,
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
