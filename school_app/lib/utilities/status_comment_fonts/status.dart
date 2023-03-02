import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/status_comment_fonts/bottom_sheet_comment.dart';

import '../assets_common.dart';
import '../colors.dart';
import '../string.dart';
import '../text_styles.dart';

class StatusStyles extends StatelessWidget {
  const StatusStyles({Key? key, this.data}) : super(key: key);
  final Student? data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17),
      decoration: BoxDecoration(
          color: CustomColors.mainTabColor,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          child: SvgPicture.asset(data!.avata),
                          radius: 26),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data!.name}',
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
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                child: Image.asset(Images.statusImages)),
            Container(
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
                      CustomIcon(IconConstant.likeIcon,size: 30),
                      Text(
                        '125',
                        style: TextStyles.textNotoSize14,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CustomIcon(IconConstant.statusHeathIcon,size: 30),
                      Text(
                        '12',
                        style: TextStyles.textNotoSize14,
                      )
                    ],
                  ),
                  GestureDetector(
                    child: Row(children: [
                      CustomIcon(IconConstant.commentIcon,size: 30),
                      Text('20', style: TextStyles.textNotoSize14,
                      )
                    ],
                    ),
                    onTap: () {
                      _handleShowBottomSheet(context);
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

  _handleShowBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return BottomSheetComment();
        });
  }
}
