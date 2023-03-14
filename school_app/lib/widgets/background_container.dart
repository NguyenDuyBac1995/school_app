import 'package:flutter/material.dart';

import '../utilities/assets_common.dart';


class MainContainer extends StatelessWidget {
  const MainContainer({key, @required this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image:
          DecorationImage(image: AssetImage(
              Images.backgroundImage),
            fit: BoxFit.cover
          )),
      child: child,
    );
  }
}
