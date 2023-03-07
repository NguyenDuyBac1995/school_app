import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/components/app_bar.dart';
import 'package:school_app/utilities/components/common_font.dart';

import '../../../utilities/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateNewRemindScreen extends StatefulWidget {
  const CreateNewRemindScreen({Key? key, this.data}) : super(key: key);
  final Student? data;

  @override
  State<CreateNewRemindScreen> createState() => _CreateNewRemindScreenState();
}

class _CreateNewRemindScreenState extends State<CreateNewRemindScreen> {
  DateTime? date;
  TimeOfDay? time;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommonV1(context,
          strTitle: '${widget.data!.name} - ${widget.data!.class_studen}'),
      body: SafeArea(
        child: Stack(children: [
          Common().logoScreen(),
          Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: ListView(
              children: [
                GestureDetector(
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Common().remindTextField(
                      textStyle: TextStyles.textInterBold(19),
                      hintValue: 'Chọn ngày',
                      controller: dateController,
                      prefixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: CustomColors.textColor,
                        size: 35,
                      ),suffixIcon: true,
                      callback: () => pickDate(context),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Common().remindTextField(
                    textStyle: TextStyles.textInterBold(19),
                    hintValue: 'Chọn giờ',
                    controller: timeController,
                    prefixIcon: Icon(
                      Icons.access_time,
                      color: CustomColors.textColor,
                      size: 35,
                    ),
                    suffixIcon: true,
                    callback: () => pickTime(context),
                  ),
                ),
                Container(
                    height: 170,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Common().remindTextField(
                      controller: textController,
                        hintValue: 'Nhắc nhở...',
                        maxLines: 10,
                        suffixIcon: false,
                        prefixIcon: Container(
                          height: 140,
                          width: 40,
                          alignment: Alignment.topCenter,
                          child: Transform.scale(
                              scale: 1.8,
                              child: CustomIcon(IconConstant.penIcon)),
                        ),
                        callback: () {})),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Common().buttonCommon(
                      textIcon: Text(
                        'Tạo nhắc nhở',
                        style: TextStyles.textNotoSanMedium(16),
                      ),
                      callBack: () {
                        var data = Event(forcusDay: date!,
                            strRemind: textController.text,
                            timeRemind: timeController.text);
                        Navigator.of(context).pop(data);
                        timeController.clear();
                        dateController.clear();
                        textController.clear();
                      }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Common().buttonCommon(
                      textIcon: Text(
                        'Huỷ',
                        style: TextStyles.textNotoSanMedium(16)
                            .copyWith(color: Colors.white),
                      ),
                      colors: false,
                      callBack: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(initialDate.year - 5),
        lastDate: DateTime(initialDate.year + 5));
    if (newDate == null) return;
    setState(() {
      date = newDate;
      if (date == null) {
        dateController.text = DateFormat('dd/MM/yy').format(initialDate);
      } else {
        dateController.text = DateFormat('dd/MM/yy').format(date!);
      }
    });
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 45);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );
    if (newTime == null) return;
    setState(() {
      time = newTime;
      if (time == null) {
        final hours1 = initialTime.hour.toString().padLeft(2, '0');
        final minutes1 = initialTime.minute.toString().padLeft(2, '0');
        timeController.text = '$hours1:$minutes1';
      } else {
        final hours = time!.hour.toString().padLeft(2, '0');
        final minutes = time!.minute.toString().padLeft(2, '0');
        timeController.text = '$hours:$minutes';
      }
    });
  }
}

class Event{
  DateTime forcusDay;
  String strRemind;
  String timeRemind;
  Event({required this.forcusDay, required this.strRemind, required this.timeRemind});
}