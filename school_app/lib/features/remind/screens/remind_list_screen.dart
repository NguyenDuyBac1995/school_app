import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/core/models/student_model.dart';
import 'package:school_app/routers/app_router_name.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/background_container.dart';

import '../../../utilities/text_styles.dart';
import '../../../widgets/appbar/app_bar.dart';

class RemindListScreen extends StatefulWidget {
  const RemindListScreen({Key? key, this.data}) : super(key: key);
  final List<StudentModel>? data;

  @override
  State<RemindListScreen> createState() => _RemindListScreenState();
}

class _RemindListScreenState extends State<RemindListScreen> {
  final DateTime _date = DateTime.now();
  List<String> daylist = [];
  List<String> listDay = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<String> dayList = List<String>.generate(
        6, (index) => '${_date.day + index}/${_date.month}/${_date.year}');
    daylist = ['Hôm nay', 'Ngày Mai', ...dayList.getRange(2, dayList.length)];
    listDay = dayList;
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context,
            strTitle: '${widget.data![0].className}', callback: () {
          Navigator.pop(context);
        }),
        body: SafeArea(
          child: Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemCount: daylist.length,
                itemBuilder: (BuildContext context, index) {
                  return ListStudentItem(
                    day: daylist[index],
                    dateTime: listDay[index],
                    listStudent: widget.data,
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: CustomColors.purpleColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}

class ListStudentItem extends StatelessWidget {
  const ListStudentItem({Key? key, this.day, this.dateTime, this.listStudent})
      : super(key: key);
  final String? day;
  final String? dateTime;
  final List<StudentModel>? listStudent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: CustomColors.greenColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day ?? '',
            style: TextStyles.textInterBold(19),
          ),
          const SizedBox(height: 6),
          const CustomUnderline(
            size: 1,
          ),
          ...listStudent!
              .map((data) => GestureDetector(
                    onTap: () {
                      DataBundle value = DataBundle(data: data);
                     context.goNamed(AppRouterName.remindDetailRouter, extra: value);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 22,
                                  child: Image.network(data.avata!)),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.name!,
                                    style: TextStyles.textInterBold(15),
                                  ),
                                  Text(
                                    '18:01 , $dateTime',
                                    style: TextStyles.textInterMedium(14),
                                  )
                                ],
                              )
                            ],
                          ),
                          const CustomIcon(IconConstant.circleActionIcon,
                              size: 29)
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
