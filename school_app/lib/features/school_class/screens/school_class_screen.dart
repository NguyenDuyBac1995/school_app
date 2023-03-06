import 'package:flutter/material.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/components/app_bar.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/utilities/posts_comment/custom_posts.dart';

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
                      itemCount: dummyData.length,
                      itemBuilder: (BuildContext context, index) {
                        return PostsStyles(data: dummyData[index]);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.textColor,
      child: CustomIcon(IconConstant.penIcon, size: 30, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
