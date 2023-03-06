import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/components/app_bar.dart';
import 'package:school_app/utilities/components/common_font.dart';

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
                            return Common().homeItemStudent(
                                name: dummyData[index].name,
                                className: dummyData[index].class_studen,
                                teacherName: dummyData[index].teacher,
                                avatarAssets: dummyData[index].avata,
                                width: MediaQuery.of(context).size.width,
                                height: 123,
                                boxItem: false,
                                callBackTop: (){
                                  var value = DataBundle(data: dummyData[index]);
                                  NavigatorUtils.push(context, RouterGenerator.routeRemindDetail,data: value);
                                }
                            );
                          },
                          itemCount: dummyData.length)
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
