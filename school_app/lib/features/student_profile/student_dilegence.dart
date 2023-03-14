import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/custom_styles.dart';

import '../../widgets/common_widget.dart';
import '../../utilities/text_styles.dart';

class StudentDilegence extends StatefulWidget {
  const StudentDilegence({Key? key}) : super(key: key);

  @override
  State<StudentDilegence> createState() => _StudentDilegenceState();
}

class _StudentDilegenceState extends State<StudentDilegence> {
  final _textController = TextEditingController();
  DateTime now = DateTime.now();

  int? _selectedIndex = 1;

  DateTime date = DateTime.now();
  DateTime lastDayOfMonth = DateTime(DateTime.now().year, DateTime.now().month +1, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController.text = 'Tháng ${date.month} , Năm ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            style: TextStyles.textInterMedium(17),
            controller: _textController,
            decoration: CustomStyles.inputDecorationBorder(
              borderColor: CustomColors.purpleColor,
              suffixIcon: Icon(Icons.keyboard_arrow_down, size: 50,color: CustomColors.purpleColor,),
            ),
            onTap: ()=>pickDate(context),
          ),
        ),

        Expanded(
            child: ListView.builder(
                itemCount: lastDayOfMonth.day,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.only(top: 12),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                      decoration: BoxDecoration(
                          color: _selectedIndex == index?CustomColors.pinkColor:CustomColors.greenColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${(lastDayOfMonth.day - index).toString().padLeft(2, '0')}/${DateFormat('MM/yyyy').format(lastDayOfMonth)}",
                            style: TextStyles.textInterBold(18).copyWith(color: _selectedIndex == index?Colors.white:CustomColors.purpleColor),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      color:_selectedIndex == index?Colors.white:CustomColors.purpleColor, height: 1)),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: _selectedIndex == index?CustomColors.pinkColor:CustomColors.purpleColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                              ),
                              Expanded(
                                  child: Container(
                                      color: _selectedIndex == index?Colors.white:CustomColors.purpleColor, height: 1)),
                            ],
                          ),
                          _selectedIndex ==index?
                          Text(
                            'Nghỉ',
                            style: TextStyles.textInterMedium(15).copyWith(color: Colors.white),
                          )
                          :Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Giờ đến:   08:00',
                                style: TextStyles.textInterMedium(15),
                              ),
                              Text(
                                'Giờ về:   17:30',
                                style: TextStyles.textInterMedium(15),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                }))
      ]),
    );
  }
  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await DatePicker.showPicker(
        context,
        pickerModel: CustomMonthPicker(
            minTime: DateTime(2020, 1, 1),
        maxTime: DateTime(2025,1,1),
        currentTime: DateTime.now(),
          locale: LocaleType.vi
    )
    );
    if (newDate == null) return;
    setState(() {
      date = newDate;
      _textController.text = 'Tháng ${date.month} , Năm ${date.year}';
      lastDayOfMonth = DateTime(date.year,date.month +1 ,0);
    });
  }

}

class CustomMonthPicker extends DatePickerModel {
  CustomMonthPicker({DateTime? currentTime, DateTime? minTime, DateTime? maxTime,
    LocaleType? locale}) : super(locale: locale, minTime: minTime, maxTime:
  maxTime, currentTime: currentTime);

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }
}
