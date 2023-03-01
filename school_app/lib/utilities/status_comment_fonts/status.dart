import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/utilities/dummy_data.dart';

import '../assets.dart';
import '../colors.dart';
import '../utils/string.dart';
import '../utils/text_styles.dart';

class SchoolClassStatus extends StatefulWidget {
  const SchoolClassStatus({Key? key}) : super(key: key);

  @override
  State<SchoolClassStatus> createState() => _SchoolClassStatusState();
}

class _SchoolClassStatusState extends State<SchoolClassStatus> {
  late bool changeSize = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17),
      height: MediaQuery.of(context).size.height * 0.59,
      decoration: BoxDecoration(
          color: CustomColors.mainTabColor,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          child: SvgPicture.asset(Images.notificationIcon1),
                          radius: 26),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Desmond Camire',
                            style: TextStyles.textNotoSizeBold16,
                          ),
                          SizedBox(height: 3),
                          Text(
                            '18:01 19/8/2020',
                            style: TextStyles.textNotoSize14,
                          ),
                          SizedBox(height: 6)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(Strings.STATUS, style: TextStyles.textNotoSize16),
                  SizedBox(height: 5)
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Transform.scale(
                    scale: 1.145, child: Image.asset(Images.statusImages))),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 2,
              width: MediaQuery.of(context).size.width * 0.88,
              color: CustomColors.textColor,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.88,
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 40,
                          child: SvgPicture.asset(IconConstant.likeIcon)),
                      Text(
                        '125',
                        style: TextStyles.textNotoSize14,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 40,
                          child:
                              SvgPicture.asset(IconConstant.statusHeathIcon)),
                      Text(
                        '12',
                        style: TextStyles.textNotoSize14,
                      )
                    ],
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Container(
                            height: 25,
                            width: 40,
                            child: SvgPicture.asset(IconConstant.commentIcon)),
                        Text(
                          '20',
                          style: TextStyles.textNotoSize14,
                        )
                      ],
                    ),
                    onTap: () {
                      _handleShowBottomSheet();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet({
    required String text,
    required VoidCallback onClicked,
  }) {
    return ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
        child: Text(
          text,
          style: TextStyle(fontSize: 30),
        ));
  }

  _handleShowBottomSheet() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        enableDrag: true,
        isDismissible: false,
        isScrollControlled: changeSize,
        context: context,
        builder: (_) {
          return buildSheet(changeSize);
        });
  }

  Widget buildSheet(bool change) {
    print('Data : $change');
    return Container(
        decoration: BoxDecoration(
            color: CustomColors.mainTabColor,
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20,change?40:10, 20, 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 40),
                      Text('Bình luận', style: TextStyles.textNotoSizeBold18),
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
                      Text('20', style: TextStyles.textNotoSize16),
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
            (change
                ? Positioned(
                    bottom: 0,
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
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Aa',
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                suffixIcon:
                                    SvgPicture.asset(IconConstant.makeIcon),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Positioned(
                    bottom: 30,
                    left: 20,
                    child: Common().buttonCommon(
                        textIcon: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nhập bình luận  ',
                                style: TextStyles.textNotoSize14,
                              ),
                              SvgPicture.asset(IconConstant.penIcon)
                            ],
                          ),
                        ),
                        callBack: () {
                          setState(() {
                            changeSize = true;
                            Navigator.pop(context);
                            _handleShowBottomSheet();
                          });
                        }),
                  )),
          ],
        ),
    );
  }
}
