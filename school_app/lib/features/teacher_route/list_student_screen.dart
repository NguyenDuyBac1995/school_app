import 'package:flutter/material.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../routers/fluro_navigator.dart';
import '../../utilities/text_styles.dart';

class ListStudentScreen extends StatefulWidget {
  const ListStudentScreen({Key? key, this.data}) : super(key: key);
  final Student? data;

  @override
  State<ListStudentScreen> createState() => _ListStudentScreenState();
}

class _ListStudentScreenState extends State<ListStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context,
        strTitle: 'Học sinh - ${widget.data!.class_studen}'),
        body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                      color: CustomColors.yellowColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Sĩ số:',
                              style: TextStyles.textInterMedium(20),
                            ),
                            Text(' 44', style: TextStyles.textInterBold(21)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Vắng:',
                              style: TextStyles.textInterMedium(20),
                            ),
                            Text(' 1', style: TextStyles.textInterBold(21)),
                          ],
                        ),
                        GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                'Điểm danh',
                                style: TextStyles.textInterMedium(20).copyWith(
                                    decoration: TextDecoration.underline),
                              ),
                              Icon(
                                Icons.double_arrow_rounded,
                                color: CustomColors.purpleColor,
                              )
                            ],
                          ),
                          onTap: (){
                            var data = DataBundle(data: widget.data);
                            NavigatorUtils.push(context, RouterGenerator.routeStudentAttendance,data: data);
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: dummyData.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              height: 115,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Common().homeItemStudent(
                                        name: dummyData[index].name,
                                        className: dummyData[index].class_studen,
                                        teacherName: dummyData[index].teacher,
                                        avatarAssets: dummyData[index].avata,
                                        suffixIcon: GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                                            decoration: BoxDecoration(
                                                color: CustomColors.yellowColor,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Text('Thông tin', style: TextStyles.textInterMedium(14),),
                                          ),
                                          onTap: (){
                                            var data = DataBundle(data: dummyData[index]);
                                            NavigatorUtils.push(context, RouterGenerator.routeStudentInformation, data: data);
                                          },
                                        ),
                                    ),
                                    Common().underLine(
                                        width: MediaQuery.of(context).size.width*0.35,
                                        color: CustomColors.purpleColor
                                    )
                                  ]
                              ),
                            );
                          }))
                ],
              ),
          ),
        ),
      ),
    );
  }
}
