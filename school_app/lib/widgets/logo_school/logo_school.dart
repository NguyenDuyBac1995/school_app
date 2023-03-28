import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/assets_common.dart';

class GetLogo extends StatelessWidget {
  const GetLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.7,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        child: SvgPicture.asset(
          Images.splashImage,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}