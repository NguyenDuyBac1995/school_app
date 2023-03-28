import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/core/models/student_model.dart';
import 'package:school_app/routers/app_router_name.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:school_app/widgets/number_header/header.dart';

import '../../../utilities/text_styles.dart';

class ListStudentScreen extends StatefulWidget {
  const ListStudentScreen({Key? key, this.data}) : super(key: key);
  final List<StudentModel>? data;

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
        strTitle: 'Học sinh - ${widget.data![0].className}',callback: (){Navigator.pop(context);}),
        body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  NumberHeader(
                    numberStudent: widget.data!.length.toString(),
                    textButton: GestureDetector(
                    child: Row(
                      children: [
                        Text(
                          'Điểm danh',
                          style: TextStyles.textInterMedium(20).copyWith(
                              decoration: TextDecoration.underline),
                        ),
                       const Icon(
                          Icons.double_arrow_rounded,
                          color: CustomColors.purpleColor,
                        )
                      ],
                    ),
                    onTap: (){
                      DataBundle data =  DataBundle(listData: widget.data!);
                      context.goNamed(AppRouterName.liststudentAttendanceRouter, extra: data);
                    },
                  ),),
                  Expanded(
                      child: _loadStudentProfile(context,widget.data))
                ],
              ),
          ),
        ),
      ),
    );
  }
  Widget _loadStudentProfile(BuildContext context, List<StudentModel>? listStudent){
    return Container(
      child:  ListView.builder(
          itemCount: listStudent!.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              height: 115,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Common().homeItemStudent(
                      name: listStudent[index].name,
                      className: listStudent[index].className,
                      teacherName: listStudent[index].teacherName,
                      avatarAssets: listStudent[index].avata,
                      suffixIcon: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                          decoration: BoxDecoration(
                              color: CustomColors.yellowColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Thông tin', style: TextStyles.textInterMedium(14),),
                        ),
                        onTap: (){
                         DataBundle data1 = DataBundle(data: listStudent[index]);
                          context.goNamed(AppRouterName.studentDetailRouter,extra: data1);
                        },
                      ),
                    ),
                   const CustomUnderline()
                  ]
              ),
            );
          }),
    );
  }
}
