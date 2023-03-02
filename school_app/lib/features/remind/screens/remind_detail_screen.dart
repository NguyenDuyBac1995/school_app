import 'package:flutter/material.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/components/app_bar.dart';
import 'package:school_app/utilities/components/common_font.dart';
import 'package:school_app/data/dummy_data.dart';

class RemindDetailScreen extends StatefulWidget {
  const RemindDetailScreen({Key? key, this.data}) : super(key: key);
  final Student? data;
  @override
  State<RemindDetailScreen> createState() => _RemindDetailScreenState();
}

class _RemindDetailScreenState extends State<RemindDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context,strTitle: '${widget.data!.name} - ${widget.data!.class_studen}'),
      body: SafeArea(
        child: Stack(
          children: [
            Common().logoScreen(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        backgroundColor: CustomColors.textColor,
      child: Icon(Icons.add, color: Colors.white,),),
    );
  }
}
