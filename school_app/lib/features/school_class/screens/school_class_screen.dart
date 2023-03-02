import 'package:flutter/material.dart';
import 'package:school_app/utilities/components/app_bar.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/utilities/status_comment_fonts/status.dart';

class SchoolClassScreen extends StatefulWidget {
  const SchoolClassScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SchoolClassScreen();
}

class _SchoolClassScreen extends State<SchoolClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context,
          strTitle: 'Nguyễn Tú An - Lớp Lá',),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Common().logoScreen(),
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, index) {
                        return SchoolClassStatus();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
