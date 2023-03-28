import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/features/infomation_profile/blocs/information_profile_bloc.dart';
import 'package:school_app/features/school_class/blocs/school_class_bloc.dart';
import 'package:school_app/features/school_class/screens/create_posts_screen.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import '../../../widgets/posts_comment/comment.dart';
import '../../../widgets/posts_comment/custom_posts.dart';

class SchoolClassScreen extends StatefulWidget {
  const SchoolClassScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SchoolClassScreen();
}

class _SchoolClassScreen extends State<SchoolClassScreen> {
  List<PostStyles> listPost = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarCommonV1(
        context,
        strTitle: 'Nguyễn Tú An - Lớp Lá',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child:
            BlocBuilder<InformationProfileBloc, InformationProfileState>(
              builder: (context, userState) {
                return BlocBuilder<SchoolClassBloc, SchoolClassState>(
                  buildWhen: (a,b)=>a.loading != b.loading,
                    builder: (BuildContext context, childState) {
                      if(childState.loading == true){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: childState.listPost!.length,
                            itemBuilder: (context, index) {
                              return PostStyles(
                                listImage: childState.listPost![index].listImage,
                                content: childState.listPost![index].content,
                                nameUserPosts: childState.listPost![index].name,
                                avatarUserPost: childState.listPost![index].avataStr,
                                listUserLike: childState.listLike!.length,
                                colorIcon: childState.toggleLike,
                                listStr: childState.toggleLike == true ? 'Bạn ,${childState.listLike![0]} và ${childState.listLike!.length - 2} người khác đã thích':'${childState.listLike![0]} và ${childState.listLike!.length - 1} người khác đã thích',
                                callbackLike: (){
                                  context.read<SchoolClassBloc>().add(ToggleLikeStatus(username: userState.information![0].name));
                                },
                                callbackComment: () {
                                  _handleShowBottomSheet(context,
                                    username: userState.information![0].name,
                                    countLike: childState.listLike!.length,
                                  );
                                },
                              );
                            }),
                      );
                    });
              },
            )
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.purpleColor,
        child: const CustomIcon(IconConstant.penIcon, size: 30, color: Colors.white),
        onPressed: () async {
         await Navigator.push(context, MaterialPageRoute(builder: (_)=> const CreatePostsScreen()));
         setState(() {});
        },
      ),
    );
  }

  _handleShowBottomSheet(BuildContext context,{String? username, int? countLike, String? comment }) {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetComment(
            commentStr: comment,
            countLike: countLike,
            usernameStr: username,
          );
        });
  }
}
