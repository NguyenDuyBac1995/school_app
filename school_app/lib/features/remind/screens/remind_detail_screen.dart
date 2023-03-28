import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_app/core/models/student_model.dart';
import 'package:school_app/features/remind/screens/create_new_remind_screen.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utilities/assets_common.dart';
import '../../../utilities/text_styles.dart';

class RemindDetailScreen extends StatefulWidget {
  const RemindDetailScreen({Key? key, this.data}) : super(key: key);
  final StudentModel? data;

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
    mySelectedEvents = {};
    super.initState();
  }

  List<Event> _listOfDayEvents(DateTime dateTime) {
    String dateTimeFormat = DateFormat('yyyy-MM-dd').format(dateTime);
    return mySelectedEvents[dateTimeFormat] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context,
          strTitle: '${widget.data!.name} - ${widget.data!.className}', callback: (){Navigator.pop(context);}),
      body: SafeArea(
        child: Stack(
          children: [
            Common().logoScreen(),
            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: _calendarFormat == CalendarFormat.month
                          ? CustomColors.yellowColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleChildScrollView(
                        child: TableCalendar(
                          eventLoader: _listOfDayEvents,
                          rowHeight:
                              _calendarFormat == CalendarFormat.week ? 100 : 50,
                          daysOfWeekHeight: 35,
                          weekendDays: const [DateTime.sunday, 6],
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
                                  const BoxDecoration(color: Colors.red),
                              headerPadding: const EdgeInsets.fromLTRB(20, 10, 10, 0)),
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
                                selectedCalendarDate = selectedDay;
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
                                              ? const Icon(Icons.arrow_drop_down,
                                                  color: CustomColors.purpleColor,
                                                  size: 32)
                                              : const Icon(Icons.arrow_drop_up,
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
                                              ? const Icon(Icons.arrow_drop_down,
                                                  color: CustomColors.purpleColor,
                                                  size: 32)
                                              : const Icon(Icons.arrow_drop_up,
                                                  color: CustomColors.purpleColor,
                                                  size: 32))
                                    ],
                                  )
                                ],
                              );
                            },
                            dowBuilder: (context, day) {
                              if (_calendarFormat == CalendarFormat.month) {
                                {
                                  switch (day.weekday) {
                                    case DateTime.sunday:
                                      return weeksday('CN');
                                    case DateTime.monday:
                                      return weeksday('T2');
                                    case DateTime.tuesday:
                                      return weeksday('T3');
                                    case DateTime.wednesday:
                                      return weeksday('T4');
                                    case DateTime.thursday:
                                      return weeksday('T5');
                                    case DateTime.friday:
                                      return weeksday('T6');
                                    case DateTime.saturday:
                                      return weeksday('T7');
                                  }
                                }
                              }
                              return const SizedBox();
                            },
                            prioritizedBuilder: (context, day, forcusDay) {
                              {
                                if (_calendarFormat == CalendarFormat.week) {
                                  switch (day.weekday) {
                                    case DateTime.sunday:
                                      return Common().dayItem(
                                          strDay: '${day.day}',
                                          strThu: 'Chủ Nhật');
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
                              return null;
                            },
                            selectedBuilder: (context, day, focusedDay) {
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
                            },
                            todayBuilder: (context, day, focusedDay) {
                              return Center(
                                child: CircleAvatar(
                                  backgroundColor:
                                      CustomColors.pinkColor.withOpacity(0.5),
                                  radius: 25,
                                  child: Text(
                                    day.day.toString(),
                                    style: TextStyles.textPoppinBold(15)
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 1,
                        color: CustomColors.purpleColor,
                      ),
                      ..._listOfDayEvents(selectedCalendarDate)
                          .map((myEvent) => Column(
                                children: [
                                  ListTile(
                                    leading: const CustomIcon(
                                        IconConstant.circleActionIcon,
                                        size: 30),
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        myEvent.strRemind,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3),
                                          child: Text(
                                            myEvent.timeRemind,
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
            String dateFormat =
                DateFormat("yyyy-MM-dd").format(selectedCalendarDate);
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
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  Widget weeksday(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyles.textPoppinBold(18, color: false),
      ),
    );
  }
}
