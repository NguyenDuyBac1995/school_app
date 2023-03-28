import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/background_container.dart';
import '../../../core/models/student_model.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/text_styles.dart';
import '../../../widgets/number_header/header.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({Key? key, this.data}) : super(key: key);
  final List<StudentModel>? data;

  @override
  State<StudentAttendanceScreen> createState() =>
      _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  DateTime dateTime = DateTime.now();
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());

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
            strTitle: 'Điểm danh - ${widget.data![0].className}',callback: (){Navigator.pop(context);}),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:  Column(
              children: [
                NumberHeader(
                  numberStudent: widget.data!.length.toString(),
                  textButton: GestureDetector(
                  child: Row(
                    children: [
                      Text(
                        date,
                        style: TextStyles.textInterMedium(18),
                      ),
                      const CustomIcon(
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
                ),),
                Expanded(
                    child: LoadAttendance(date: date,listStudent: widget.data,))
              ],
            )
          ),
        ),
      ),
    );
  }
}


class LoadAttendance extends StatefulWidget {
  const LoadAttendance({Key? key,required this.date, this.listStudent}) : super(key: key);
  final String date;
  final List<StudentModel>? listStudent;
  @override
  State<LoadAttendance> createState() => LoadAttendanceState();
}

class LoadAttendanceState extends State<LoadAttendance> {
  final _selectedButton = [];
  final _selectedButton1 = [];
  final _selectedButton2 = [];

  @override
  Widget build(BuildContext context) {
  return Container(
    child: ListView.builder(
        itemCount: widget.listStudent!.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
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
                    backgroundImage: NetworkImage(widget.listStudent![index].avata!),
                    radius: 23),
                  title: Text(
                    widget.listStudent![index].name!,
                    style: TextStyles.textInterBold(15),
                  ),
                  subtitle: Text(
                    '${widget.date} , 07:30 -15:30',
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
                                ? const Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Icon(
                                Icons.check,
                                color: CustomColors
                                    .purpleColor,
                              ),
                            ):const SizedBox(),
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
                                ? const Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Icon(
                                Icons.check,
                                color: CustomColors
                                    .purpleColor,
                              ),
                            ):const SizedBox()
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
                                ?const Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ): const SizedBox(),
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
        }),
  );
  }
}
