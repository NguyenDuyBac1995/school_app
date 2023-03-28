import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_app/core/models/student_model.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/custom_styles.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/common_widget.dart';
import '../../../utilities/text_styles.dart';


class CreateNewRemindScreen extends StatefulWidget {
  const CreateNewRemindScreen({Key? key, this.data}) : super(key: key);
  final StudentModel? data;

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
      resizeToAvoidBottomInset: false,
      appBar: appBarCommonV1(context,
          strTitle: '${widget.data!.name} - ${widget.data!.className}',callback: (){Navigator.pop(context);}),
      body: SafeArea(
        child: Stack(children: [
          Common().logoScreen(),
          Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    style: TextStyles.textInterMedium(18),
                    controller: dateController,
                    decoration: CustomStyles.inputDecorationBorder(
                      prefixIcon: const Icon(Icons.calendar_month_outlined,color: CustomColors.purpleColor,size: 35,),
                      suffixIcon: const Icon(Icons.keyboard_arrow_down, size: 50,color: CustomColors.purpleColor,),
                      borderColor: CustomColors.greenColor,
                      hintText: 'Chọn ngày'
                    ),
                    onTap: () => pickDate(context),
                  )
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      style: TextStyles.textInterMedium(18),
                      controller: timeController,
                      decoration: CustomStyles.inputDecorationBorder(
                          prefixIcon: const Icon(Icons.access_time,color: CustomColors.purpleColor,size: 35,),
                          suffixIcon: const Icon(Icons.keyboard_arrow_down, size: 50,color: CustomColors.purpleColor,),
                          borderColor: CustomColors.greenColor,
                          hintText: 'Chọn giờ'
                      ),
                      onTap: () => pickTime(context),
                    )
                ),
                Container(
                    height: 170,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      style: TextStyles.textInterMedium(16),
                      controller: textController,
                      maxLines: 10,
                      decoration: CustomStyles.inputDecorationBorder(
                        hintText: 'Nhắc nhở...',
                        prefixIcon: Container(
                          height: 140,
                          width: 40,
                          alignment: Alignment.topCenter,
                          child: Transform.scale(
                              scale: 1.8,
                              child: const CustomIcon(IconConstant.penIcon)),
                        ),
                        borderColor: CustomColors.greenColor,
                      ),
                    ),),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
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
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Common().buttonCommon(
                      textIcon: Text(
                        'Huỷ',
                        style: TextStyles.textNotoSanMedium(16)
                            .copyWith(color: Colors.white),
                      ),
                      colors: CustomColors.pinkColor,
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