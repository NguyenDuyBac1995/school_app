import 'package:flutter/material.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';

class WidgetNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommonV1(context),
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
