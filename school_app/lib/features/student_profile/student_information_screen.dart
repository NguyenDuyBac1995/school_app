import 'package:flutter/material.dart';
import 'package:school_app/features/student_profile/student_dilegence.dart';
import 'package:school_app/features/student_profile/student_profile.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/data/dummy_data.dart';

import '../../utilities/components/app_bar.dart';
import '../../utilities/text_styles.dart';

class StudentInformationScreen extends StatefulWidget {
  const StudentInformationScreen({Key? key, this.data }) : super(key: key);
  final Student? data;
  @override
  State<StudentInformationScreen> createState() => _StudentInformationScreenState();
}

class _StudentInformationScreenState extends State<StudentInformationScreen> {
  PageController pageController = PageController();
  List<String> _listItem = ['Thông tin', 'Chuyên cần', ' Lịch học','Thành tích'];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context, strTitle: '${widget.data!.name} - Thông tin',),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              Common().logoScreen(),
              Column(
                children: [
                  Container(
                    height: 55,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listItem.length,
                        itemBuilder: (context, index){
                          return Container(
                            width:150,
                            margin: EdgeInsets.only(left: 15),
                            child: Common().buttonCommon(
                                colors: _selectedIndex == index?CustomColors.tabActiveColor:CustomColors.tabActiveColor.withOpacity(0.5),
                                colorBorder:_selectedIndex == index? CustomColors.textColor:Colors.transparent,
                                textIcon: Text(_listItem[index], style: TextStyles.textInterMedium(18),),
                                callBack: (){
                                  setState(() {
                                    _selectedIndex = index;
                                    pageController.animateToPage(_selectedIndex, duration: Duration(milliseconds: 10), curve: Curves.bounceInOut);
                                  });
                                }
                            ),
                          );
                        }),
                  ),
                  Expanded(
                      child: PageView(
                        controller: pageController,
                        pageSnapping: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index){
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        children: [
                          StudentProfile(),
                          StudentDilegence(),
                          Container(
                            color: Colors.orange,
                            constraints: BoxConstraints.expand(),
                          ),
                          Container(
                            color: Colors.pinkAccent,
                            constraints: BoxConstraints.expand(),
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
