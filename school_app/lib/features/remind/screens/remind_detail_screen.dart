import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/features/remind/screens/create_new_remind_screen.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utilities/assets_common.dart';
import '../../../utilities/text_styles.dart';

class RemindDetailScreen extends StatefulWidget {
  const RemindDetailScreen({Key? key, this.data}) : super(key: key);
  final Student? data;


  @override
  State<RemindDetailScreen> createState() => _RemindDetailScreenState();
}

class _RemindDetailScreenState extends State<RemindDetailScreen> {
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime selectedCalendarDate = DateTime.now();
  DateTime selecto = DateTime.utc(2023, 03, 17);
  bool changeIcon = true;
  DateTime? dateTime;


  late Map<String, List<Event>> mySelectedEvents;

  @override
  void initState() {
    print('input $selectedCalendarDate');
    mySelectedEvents = {};
    super.initState();
  }

  List<Event> _listOfDayEvents(DateTime dateTime) {
    String dateTimeFormat = DateFormat('yyyy-MM-dd').format(dateTime);
    return mySelectedEvents[dateTimeFormat] ?? [];
  }


  // _showAddEventDialog() async {
  //   await showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             title: const Text('New Remind'),
  //             content: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Common().loginTextField(
  //                     controller: titleController,
  //                     hintvalue: 'Nhập ngày tháng'),
  //                 const SizedBox(
  //                   height: 20.0,
  //                 ),
  //                 Common().loginTextField(
  //                     controller: descpController, hintvalue: 'Nhập nội dung'),
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   if (titleController.text.isEmpty &&
  //                       descpController.text.isEmpty) {
  //                     ScaffoldMessenger.of(context).showSnackBar(
  //                       const SnackBar(
  //                         content: Text('Please enter title & description'),
  //                         duration: Duration(seconds: 3),
  //                       ),
  //                     );
  //                     //Navigator.pop(context);
  //                     return;
  //                   } else {
  //                     setState(() {
  //
  //                       if (mySelectedEvents[selectedCalendarDate] != null) {
  //                         mySelectedEvents[selectedCalendarDate]?.add(Event(
  //                             strRemind: titleController.text,
  //                             timeRemind: descpController.text,
  //                             forcusDay: DateTime.utc(2023, 03, 17)));
  //                       } else {
  //                         mySelectedEvents[selectedCalendarDate!] = [
  //                           Event(
  //                               strRemind: titleController.text,
  //                               timeRemind: descpController.text,
  //                               forcusDay: DateTime.utc(2023, 03, 17))
  //                         ];
  //                       }
  //                     });
  //                     titleController.clear();
  //                     descpController.clear();
  //                     Navigator.pop(context);
  //                     return;
  //                   }
  //                 },
  //                 child: const Text('Thêm Nhắc Nhở'),
  //               ),
  //               TextButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 child: const Text('Thoát'),
  //               ),
  //             ],
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context,
          strTitle: '${widget.data!.name} - ${widget.data!.class_studen}'),
      body: SafeArea(
        child: Stack(
          children: [
            Common().logoScreen(),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: _calendarFormat == CalendarFormat.month
                          ? CustomColors.yellowColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TableCalendar(
                        eventLoader: _listOfDayEvents,
                        rowHeight:
                            _calendarFormat == CalendarFormat.week ? 100 : 50,
                        daysOfWeekHeight: 35,
                        weekendDays: [DateTime.sunday, 6],
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        focusedDay: _focusedDay,
                        firstDay: DateTime.utc(2021, 1, 1),
                        lastDay: DateTime.utc(2030, 1, 1),
                        headerVisible: true,
                        daysOfWeekVisible: true,
                        shouldFillViewport: false,
                        headerStyle: HeaderStyle(
                            decoration: BoxDecoration(
                                color: CustomColors.yellowColor,
                                borderRadius: BorderRadius.circular(12)),
                            formatButtonShowsNext: false,
                            titleCentered: false,
                            formatButtonVisible: false,
                            leftChevronVisible: false,
                            rightChevronVisible: false,
                            formatButtonDecoration:
                                BoxDecoration(color: Colors.red),
                            headerPadding: EdgeInsets.fromLTRB(20, 10, 10, 0)),
                        calendarStyle: CalendarStyle(
                          weekendTextStyle: TextStyles.textPoppinBold(15)
                              .copyWith(color: Colors.red.shade300),
                          defaultTextStyle: TextStyles.textPoppinBold(15),
                        ),
                        calendarFormat: _calendarFormat,
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedCalendarDate, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(selectedCalendarDate, selectedDay)) {
                            setState(() {
                              print('selected : $selectedCalendarDate');
                              selectedCalendarDate = selectedDay;
                              print('output : $selectedCalendarDate');
                              _focusedDay = focusedDay;
                            });
                          }
                        },
                        calendarBuilders: CalendarBuilders(
                            headerTitleBuilder: (context, day) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Tháng ${day.month}',
                                    style: TextStyles.textPoppinBold(24)
                                        .copyWith(
                                            color: CustomColors.purpleColor),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_calendarFormat ==
                                              CalendarFormat.month) {
                                            setState(() {
                                              _calendarFormat =
                                                  CalendarFormat.week;
                                            });
                                          } else if (_calendarFormat ==
                                              CalendarFormat.week) {
                                            setState(() {
                                              _calendarFormat =
                                                  CalendarFormat.month;
                                            });
                                          }
                                        });
                                      },
                                      icon: _calendarFormat ==
                                              CalendarFormat.month
                                          ? Icon(Icons.arrow_drop_down,
                                              color: CustomColors.purpleColor,
                                              size: 32)
                                          : Icon(Icons.arrow_drop_up,
                                              color: CustomColors.purpleColor,
                                              size: 32))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${day.year}',
                                    style: TextStyles.textPoppinMedium(24)
                                        .copyWith(
                                            color: CustomColors.purpleColor),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          changeIcon = !changeIcon;
                                        });
                                      },
                                      icon: changeIcon
                                          ? Icon(Icons.arrow_drop_down,
                                              color: CustomColors.purpleColor,
                                              size: 32)
                                          : Icon(Icons.arrow_drop_up,
                                              color: CustomColors.purpleColor,
                                              size: 32))
                                ],
                              )
                            ],
                          );
                        }, dowBuilder: (context, day) {
                          if (_calendarFormat == CalendarFormat.month) {
                            {
                              switch (day.weekday) {
                                case DateTime.sunday:
                                  return Center(
                                    child: Text(
                                      'CN',
                                      style: TextStyles.textPoppinBold(18,
                                          color: false),
                                    ),
                                  );
                                case DateTime.monday:
                                  return Center(
                                    child: Text(
                                      'T2',
                                      style: TextStyles.textPoppinBold(18,
                                          color: false),
                                    ),
                                  );
                                case DateTime.tuesday:
                                  return Center(
                                    child: Text(
                                      'T3',
                                      style: TextStyles.textPoppinBold(18,
                                          color: false),
                                    ),
                                  );
                                case DateTime.wednesday:
                                  return Center(
                                    child: Text(
                                      'T4',
                                      style: TextStyles.textPoppinBold(18,
                                          color: false),
                                    ),
                                  );
                                case DateTime.thursday:
                                  return Center(
                                    child: Text(
                                      'T5',
                                      style: TextStyles.textPoppinBold(18,
                                          color: false),
                                    ),
                                  );
                                case DateTime.friday:
                                  return Center(
                                    child: Text(
                                      'T6',
                                      style: TextStyles.textPoppinBold(18,
                                          color: false),
                                    ),
                                  );
                                case DateTime.saturday:
                                  return Center(
                                    child: Text(
                                      'T7',
                                      style: TextStyles.textPoppinBold(18,
                                          color: false),
                                    ),
                                  );
                              }
                            }
                          }
                          return SizedBox();
                        }, prioritizedBuilder: (context, day, forcusDay) {
                          {
                            if (_calendarFormat == CalendarFormat.week) {
                              switch (day.weekday) {
                                case DateTime.sunday:
                                  return Common().dayItem(
                                      strDay: '${day.day}', strThu: 'Chủ Nhật');
                                case DateTime.monday:
                                  return Common().dayItem(
                                      strDay: '${day.day}', strThu: 'Thứ 2');
                                case DateTime.tuesday:
                                  return Common().dayItem(
                                      strDay: '${day.day}', strThu: 'Thứ 3');
                                case DateTime.wednesday:
                                  return Common().dayItem(
                                      strDay: '${day.day}', strThu: 'Thứ 4');
                                case DateTime.thursday:
                                  return Common().dayItem(
                                      strDay: '${day.day}', strThu: 'Thứ 5');
                                case DateTime.friday:
                                  return Common().dayItem(
                                      strDay: '${day.day}', strThu: 'Thứ 6');
                                case DateTime.saturday:
                                  return Common().dayItem(
                                      strDay: '${day.day}', strThu: 'Thứ 7');
                              }
                            } else {
                              return null;
                            }
                          }
                        }, selectedBuilder: (context, day, focusedDay) {
                          return Center(
                            child: CircleAvatar(
                              backgroundColor: CustomColors.pinkColor,
                              radius: 25,
                              child: Text(
                                day.day.toString(),
                                style: TextStyles.textPoppinBold(15)
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          );
                        }, todayBuilder: (context, day, focusedDay) {
                          return Center(
                            child: CircleAvatar(
                              child: Text(
                                day.day.toString(),
                                style: TextStyles.textPoppinBold(15)
                                    .copyWith(color: Colors.white),
                              ),
                              backgroundColor:
                                  CustomColors.pinkColor.withOpacity(0.5),
                              radius: 25,
                            ),
                          );
                        },

                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      color: CustomColors.greenColor,
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hôm Nay',
                        style: TextStyles.textInterBold(22),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 1,
                        color: CustomColors.purpleColor,
                      ),
                      ..._listOfDayEvents(selectedCalendarDate)
                          .map((myEvent) => Column(
                                children: [
                                  ListTile(
                                    leading: CustomIcon(
                                        IconConstant.circleActionIcon,
                                        size: 30),
                                    title: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        '${myEvent.strRemind}',
                                        style: TextStyles.textPoppinMedium(18),
                                      ),
                                    ),
                                    trailing: Container(
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: CustomColors.purpleColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3),
                                          child: Text(
                                            '${myEvent.timeRemind}',
                                            style:
                                                TextStyles.textPoppinMedium(18)
                                                    .copyWith(
                                                        color: Colors.white),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: CustomColors.purpleColor,
                                  )
                                ],
                              ))
                          .toList()
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: ()=>_showAddEventDialog(),
        onPressed: () async {
          Event? dataPop = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CreateNewRemindScreen(
                        data: widget.data,
                      )));
          if (dataPop == null) return print('data null');
          setState(() {
            selectedCalendarDate = dataPop.forcusDay;
            print(' out put :$selectedCalendarDate');
            String dateFormat = DateFormat("yyyy-MM-dd").format(selectedCalendarDate);
            if (mySelectedEvents[selectedCalendarDate] != null) {
              mySelectedEvents[dateFormat]?.add(Event(
                  strRemind: dataPop.strRemind,
                  timeRemind: dataPop.timeRemind,
                  forcusDay: DateTime.utc(2023, 03, 17)));
            } else {
              mySelectedEvents[dateFormat] = [
                Event(
                    strRemind: dataPop.strRemind,
                    timeRemind: dataPop.timeRemind,
                    forcusDay: DateTime.utc(2023, 03, 17)),
              ];
            }
          });
        },
        backgroundColor: CustomColors.purpleColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
