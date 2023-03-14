import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../../core/models/data_bundle.dart';
import '../../../utilities/assets_common.dart';
import '../../../data/dummy_data.dart';
import '../../../utilities/text_styles.dart';

class RemindScreen extends StatefulWidget {
  const RemindScreen({Key? key}) : super(key: key);

  @override
  State<RemindScreen> createState() => _RemindScreenState();
}

class _RemindScreenState extends State<RemindScreen> {
  var _selectedIndex = 0 ;
  var _listItem = ['Nhắc nhở', 'Xin nghỉ'];
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarCommonV1(context,strTitle: 'Nhắc nhở' ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
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
                      ListRemind(),
                      ListRest(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ListRemind extends StatelessWidget {
  const ListRemind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = ['39','35','40','41'];
    return Container(
      constraints: BoxConstraints.expand(),
      child: ListView.builder(
        itemBuilder: (context, index){
          return Container(
            height: 110,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Common().homeItemStudent(
                        avatarAssets: dummyData[index].avata,
                        name: dummyData[index].class_studen,
                        subTitle: false,
                        text: '${list[index]} học sinh',
                    ),
                    onTap: (){
                      var data = DataBundle(data: dummyData[index]);
                      NavigatorUtils.push(context, RouterGenerator.routeRemindList, data: data);
                    },
                  ),
                  Common().underLine(
                      width: MediaQuery.of(context).size.width*0.35,
                      color: CustomColors.purpleColor
                  )
                ]
            ),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}

class ListRest extends StatelessWidget {
  const ListRest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = ['1','3','0','1'];
    return Container(
      constraints: BoxConstraints.expand(),
      child: ListView.builder(
        itemBuilder: (context, index){
          return Container(
            height: 110,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Common().homeItemStudent(
                      avatarAssets: dummyData[index].avata,
                      name: dummyData[index].class_studen,
                      subTitle: false,
                      text: 'Xin nghỉ : ${list[index]}',
                  ),
                  Common().underLine(
                      width: MediaQuery.of(context).size.width*0.35,
                      color: CustomColors.purpleColor
                  )
                ]
            ),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}
