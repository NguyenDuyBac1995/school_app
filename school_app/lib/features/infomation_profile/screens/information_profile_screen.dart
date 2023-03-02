import 'package:flutter/material.dart';
import 'package:school_app/utilities/components/app_bar.dart';
import 'package:school_app/utilities/components/common_font.dart';

class InformationProfileScreen extends StatefulWidget {
  const InformationProfileScreen({Key? key}) : super(key: key);

  @override
  State<InformationProfileScreen> createState() => _InformationProfileScreenState();
}

class _InformationProfileScreenState extends State<InformationProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommonV1(context,strTitle: 'Cá nhân' ),
      body: SafeArea(
        child: Stack(
          children: [
            Common().logoScreen(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
