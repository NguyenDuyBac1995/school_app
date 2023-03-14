import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/custom_styles.dart';
import '../../data/dummy_data.dart';
import '../../utilities/assets_common.dart';
import '../../utilities/colors.dart';
import '../../utilities/text_styles.dart';
import '../../widgets/common_widget.dart';

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
            color: CustomColors.greenColor,
            borderRadius:BorderRadius.vertical(top: Radius.circular(20)) ),
        child: Stack(
          children: [
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
                            color: CustomColors.purpleColor,
                          ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    height: 2,
                    color: CustomColors.purpleColor,
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
            (changeSize
                ? Align(
              alignment: Alignment.bottomCenter,
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
            )
                : Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
                color: CustomColors.yellowColor,
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios)),
                    Expanded(
                      child:
                        TextFormField(
                          controller: _commentController,
                          decoration: CustomStyles.inputDecorationBorder(
                            borderColor: Colors.transparent,
                            hintText: 'Aa',
                              suffixIcon: CustomIcon(IconConstant.makeIcon,)
                          ),
                        )
                    ),
                  ],
                ),
              ),
          )),
          ],
        ),
      );
    });
  }
}
