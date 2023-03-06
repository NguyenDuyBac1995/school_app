import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/utilities/common.dart';

import '../../data/dummy_data.dart';
import '../assets_common.dart';
import '../colors.dart';
import '../components/common_font.dart';
import '../text_styles.dart';

class BottomSheetComment extends StatefulWidget {
  const BottomSheetComment({Key? key}) : super(key: key);

  @override
  State<BottomSheetComment> createState() => _BottomSheetCommentState();
}

class _BottomSheetCommentState extends State<BottomSheetComment> {
  final _commentController = TextEditingController();
  bool changeSize = true;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: changeSize?0.6:1,
        minChildSize: 0.5,
        maxChildSize: 1,
        builder: (_,controller){
      return Container(
        decoration: BoxDecoration(
            color: CustomColors.mainTabColor,
            borderRadius:BorderRadius.vertical(top: Radius.circular(20)) ),
        child: Stack(
          children: [
            if (changeSize) Positioned(
              bottom: 30,
              left: 20,
              child: Common().buttonCommon(
                  textIcon: Container(
                    width: MediaQuery.of(context).size.width-40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nhập bình luận  ',
                          style: TextStyles.textNotoSanMedium(14),
                        ),
                        SvgPicture.asset(IconConstant.penIcon)
                      ],
                    ),
                  ),
                  callBack: () {
                    setState(() {
                      changeSize = false;
                    });
                  }),
            ) else Positioned(
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
                  color: CustomColors.tabActiveColor,
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios)),
                      Expanded(
                          child: Common().commentTextField(
                            controller: _commentController,
                            hintValue: 'Aa',
                            suffixIcon: CustomIcon(IconConstant.makeIcon,),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20,changeSize?10:40, 20, 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 40),
                      Text('Bình luận', style: TextStyles.textNotoSanBold(20)),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: CustomColors.textColor,
                          ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    height: 2,
                    color: CustomColors.textColor,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset(IconConstant.statusHeathIcon),
                      SizedBox(width: 10),
                      Text('20', style: TextStyles.textNotoSanMedium(16)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Expanded(
                      child: ListView.separated(
                        itemCount: dummyData.length,
                        itemBuilder: (context, index) {
                          return Common().commentFonts(
                              strName: dummyData[index].name,
                              strComment: 'anh dep the nhi',
                              scountLike: 20);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 15);
                        },
                      )),
                  SizedBox(height: 15),
                ],
              ),
            ),

          ],
        ),
      );
    });
  }
}
