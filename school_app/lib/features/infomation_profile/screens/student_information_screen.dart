import 'package:flutter/material.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/data/dummy_data.dart';

import '../../../utilities/components/app_bar.dart';

class StudentInformationScreen extends StatefulWidget {
  const StudentInformationScreen({Key? key, this.data }) : super(key: key);
  final Student? data;
 // final Student data ;
  @override
  State<StudentInformationScreen> createState() => _StudentInformationScreenState();
}

class _StudentInformationScreenState extends State<StudentInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context, strTitle: '${widget.data!.name} - Thông tin',),
      body: SafeArea(
        child: Container(
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
