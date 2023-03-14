import 'package:flutter/material.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../../utilities/text_styles.dart';
import '../../../widgets/appbar/app_bar.dart';

 class RemindListScreen extends StatefulWidget {
   const RemindListScreen({Key? key, this.data}) : super(key: key);
 final Student? data;
   @override
   State<RemindListScreen> createState() => _RemindListScreenState();
 }

 class _RemindListScreenState extends State<RemindListScreen> {
   DateTime _date = DateTime.now();
   List<String> daylist= [];
   List<String> listDay = [];
   @override
   void initState() {
    // TODO: implement initState
    super.initState();
    List<String> _dayList = List<String>.generate(6, (index) => '${_date.day + index}/${_date.month}/${_date.year}');
    daylist = ['Hôm nay', 'Ngày Mai',..._dayList.getRange(2, _dayList.length)];
    listDay = _dayList;
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: appBarCommonV1(context, strTitle:'${widget.data!.class_studen}'),
       body: SafeArea(
         child: Stack(
           children: [
             Common().logoScreen(),
             Container(
               constraints: BoxConstraints.expand(),
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: ListView.builder(
                 itemCount: daylist.length,
                   itemBuilder: (BuildContext context, index){
                   return Container(
                     padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                     margin: EdgeInsets.symmetric(vertical: 8),
                     decoration: BoxDecoration(
                       color: CustomColors.greenColor,
                       borderRadius: BorderRadius.circular(14),
                     ),
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('${daylist[index]}', style: TextStyles.textInterBold(19), ),
                         SizedBox(height: 6),
                         Common().underLine(),
                         ...dummyData.map((data) => GestureDetector(
                   onTap: (){
                     var value = DataBundle(data: data);
                     NavigatorUtils.push(context, RouterGenerator.routeRemindDetail, data: value);
                   },
                           child: Container(
                             margin: EdgeInsets.symmetric(vertical: 8),
                             height: 42,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                             children: [
                               CircleAvatar(child: CustomIcon(data.avata, size: 25,),
                                  radius: 22),
                               SizedBox( width:  8),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(data.name, style: TextStyles.textInterBold(15),),
                                   Text('18:01 ${listDay[index]}', style: TextStyles.textInterMedium(14),)
                                 ],
                               )
                             ],
                       ),
                       CustomIcon(IconConstant.circleActionIcon, size: 29)
                     ],
                   ),
                           ),
                         )).toList(),
                       ],
                     ),
                   );
                   }
               ),
             ),
           ],
         ),
       ),
       floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: CustomColors.purpleColor,child: Icon(Icons.add, color: Colors.white,size: 32,),),
     );
   }
 }
