import 'package:flutter/material.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/utilities/dummy_data.dart';

import '../../utilities/components/app_bar.dart';

class StudentInformationScreen extends StatefulWidget {
  const StudentInformationScreen({Key? key, }) : super(key: key);
 // final Student data ;
  @override
  State<StudentInformationScreen> createState() => _StudentInformationScreenState();
}

class _StudentInformationScreenState extends State<StudentInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarCommonV1(context, strTitle: ' - Thông tin',),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              Common().logoScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
