import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../utilities/text_styles.dart';

class NumberHeader extends StatelessWidget {
  const NumberHeader({Key? key , required this.textButton,this.numberStudent}) : super(key: key);
  final Widget textButton;
  final String? numberStudent;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: EdgeInsets.only(top: 25, bottom: 20),
      decoration: BoxDecoration(
        color: CustomColors.yellowColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Sĩ số: ',
                style: TextStyles.textInterMedium(20),
              ),
              Text(numberStudent??'', style: TextStyles.textInterBold(21)),
            ],
          ),
          Row(
            children: [
              Text(
                'Vắng: ',
                style: TextStyles.textInterMedium(20),
              ),
              Text(' 1', style: TextStyles.textInterBold(21)),
            ],
          ),
          textButton,
        ],
      ),
    );
  }
}
