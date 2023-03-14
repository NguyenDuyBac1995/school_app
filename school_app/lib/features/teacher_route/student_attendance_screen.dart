import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../utilities/colors.dart';
import '../../utilities/text_styles.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({Key? key, this.data}) : super(key: key);
  final Student? data;

  @override
  State<StudentAttendanceScreen> createState() =>
      _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  DateTime dateTime = DateTime.now();
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  var _selectedButton = [];
  var _selectedButton1 = [];
  var _selectedButton2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context,
            strTitle: 'Điểm danh - ${widget.data!.class_studen}'),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:  Column(
              children: [
                SizedBox(height: 15),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  margin: EdgeInsets.only(top: 10, bottom: 10),
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
                              date,
                              style: TextStyles.textInterMedium(18),
                            ),
                            CustomIcon(
                              IconConstant.arrowIcon,
                              color: CustomColors.purpleColor,
                              size: 25,
                            )
                          ],
                        ),
                        onTap: () async {
                          final newDate = await showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime(dateTime.year - 2),
                              lastDate: DateTime(dateTime.year + 2));
                          if (newDate == null) return;
                          setState(() {
                            date = DateFormat('dd/MM/yyyy').format(newDate);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                        itemCount: dummyData.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 7),
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                            decoration: BoxDecoration(
                              color: CustomColors.greenColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    child: CustomIcon(dummyData[index].avata,),
                                    backgroundColor: Colors.blue,),
                                  title: Text(
                                    dummyData[index].name,
                                    style: TextStyles.textInterBold(15),
                                  ),
                                  subtitle: Text(
                                    '$date , 07:30 -15:30',
                                    style: TextStyles.textInterMedium(12),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_selectedButton.contains(index)){
                                            _selectedButton.remove(index);
                                          }else{
                                            _selectedButton.add(index);
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: _selectedButton.contains(index)
                                              ? CustomColors.yellowColor.withOpacity(0.5)
                                              : CustomColors.yellowColor,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            _selectedButton.contains(index)
                                                ? Padding(
                                              padding: EdgeInsets.only(right: 6),
                                              child: Icon(
                                                Icons.check,
                                                color: CustomColors
                                                    .purpleColor,
                                              ),
                                            ):SizedBox(),
                                            Text(
                                              'Đã đến',
                                              style: TextStyles
                                                  .textInterMedium(15),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_selectedButton1.contains(index)){
                                            _selectedButton1.remove(index);
                                          }else{
                                            _selectedButton1.add(index);
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: _selectedButton1.contains(index)
                                              ? CustomColors.yellowColor.withOpacity(0.5)
                                              : CustomColors.yellowColor,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            _selectedButton1.contains(index)
                                                ? Padding(
                                              padding: EdgeInsets.only(right: 6),
                                              child: Icon(
                                                Icons.check,
                                                color: CustomColors
                                                    .purpleColor,
                                              ),
                                            ):SizedBox()
                                            ,
                                            Text(
                                              'Đã về',
                                              style: TextStyles
                                                  .textInterMedium(15),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_selectedButton2.contains(index)){
                                            _selectedButton2.remove(index);
                                          }else{
                                            _selectedButton2.add(index);
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: _selectedButton2.contains(index)
                                              ? CustomColors.pinkColor.withOpacity(0.5)
                                              : CustomColors.pinkColor
                                          ,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            _selectedButton2.contains(index)
                                                ?Padding(
                                              padding: EdgeInsets.only(right: 6),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            ): SizedBox(),
                                            Text(
                                              'Nghỉ',
                                              style: TextStyles
                                                  .textInterMedium(15)
                                                  .copyWith(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }))
              ],
            )
          ),
        ),
      ),
    );
  }
}
