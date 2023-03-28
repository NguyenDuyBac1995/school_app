import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/text_styles.dart';


class CustomIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double? size;

  const CustomIcon(
      this.path, {
        Key? key,
        this.color,
        this.size = 24,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path,
        height: size, width: size, color: color, fit: BoxFit.scaleDown);
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  const GradientText(this.text,
      {Key? key,this.style,
        required this.gradient
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class CustomUnderline extends StatelessWidget {
  const CustomUnderline({Key? key, this.color = CustomColors.purpleColor, this.circleColor = CustomColors.purpleColor, this.size = 0.8}) : super(key: key);
 final Color? color ;
 final Color? circleColor;
 final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*size!,
      child: Row(
        children: [
          Expanded(
              child: Container(
                  color:color, height: 1)),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.white, width: 2)),
          ),
          Expanded(
              child: Container(
                  color: color, height: 1)),
        ],
      ),
    );
  }
}

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
      width: widthBox,
      padding: EdgeInsets.symmetric(vertical: 23,),
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