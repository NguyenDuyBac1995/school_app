import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utilities/text_styles.dart';

class BoxItemHome extends StatelessWidget {
  final Color? backgroundColor;
  final String strIcon;
  final String? content;
  final Color? textColor;
  final double? widthBox;
  const BoxItemHome({Key? key,this.content, required this.strIcon, this.backgroundColor, this.textColor, this.widthBox }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167,
      width: widthBox,
      padding: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0, 5),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(strIcon),
          Text(content ?? '',
              style: TextStyles.textInterBold(16).copyWith(
                color: textColor,
              )),
        ],
      ),
    );
  }
}
