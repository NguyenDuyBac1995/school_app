import 'package:flutter/material.dart';
import 'package:school_app/utilities/components/app_bar.dart';
import 'package:school_app/utilities/components/common_font.dart';

class CreatePostsScreen extends StatefulWidget {
  const CreatePostsScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostsScreen> createState() => _CreatePostsScreenState();
}

class _CreatePostsScreenState extends State<CreatePostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context, strTitle: 'Tạo bài viết'),
      body: SafeArea(
        child: Stack(
          children: [
            Common().logoScreen(),

          ],
        ),
      ),
    );
  }
}
