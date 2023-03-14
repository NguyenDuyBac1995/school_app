import 'package:flutter/material.dart';
import 'package:school_app/features/student_profile/student_dilegence.dart';
import 'package:school_app/features/student_profile/student_profile.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:school_app/data/dummy_data.dart';

import '../../utilities/assets_common.dart';
import '../../widgets/appbar/app_bar.dart';
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
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context, strTitle: '${widget.data!.name} - Thông tin',),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.backgroundImage),
                )
            ),
            child: Stack(
              children: [
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
                                  colors: _selectedIndex == index?CustomColors.yellowColor:CustomColors.yellowColor.withOpacity(0.5),
                                  colorBorder:_selectedIndex == index? CustomColors.purpleColor:Colors.transparent,
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
                            StudentProfile( dataStudent: widget.data!,),
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
      ),
    );
  }
}
