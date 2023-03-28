import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_app/core/models/comment_model.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/custom_styles.dart';
import '../../utilities/assets_common.dart';
import '../../utilities/colors.dart';
import '../../utilities/text_styles.dart';
import '../../widgets/common_widget.dart';

class BottomSheetComment extends StatefulWidget {
  const BottomSheetComment({Key? key, this.countLike, this.usernameStr, this.commentStr}) : super(key: key);
  final int? countLike;
  final String? usernameStr;
  final String? commentStr;
  @override
  State<BottomSheetComment> createState() => _BottomSheetCommentState();
}

class _BottomSheetCommentState extends State<BottomSheetComment> {
  final _commentController = TextEditingController();
  bool changeSize = true;
  List<CommentModel> listComment = [];
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: changeSize?0.6:1,
        minChildSize: 0.5,
        maxChildSize: 1,
        builder: (_,controller){
          return Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
                color: CustomColors.greenColor,
                borderRadius:BorderRadius.vertical(top: Radius.circular(20)) ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20,10, 20, 60),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const SizedBox(width: 40),
                          Text('Bình luận', style: TextStyles.textNotoSanBold(20)),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                                color: CustomColors.purpleColor,
                              ))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        height: 2,
                        color: CustomColors.purpleColor,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SvgPicture.asset(IconConstant.statusHeathIcon),
                          const SizedBox(width: 10),
                          Text(widget.countLike.toString(), style: TextStyles.textNotoSanMedium(16)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                          child: ListView.separated(
                            itemCount: listComment.length,
                            itemBuilder: (context, index) {
                              return Common().commentFonts(
                                  strName: listComment[index].username,
                                  strComment: listComment[index].comment,
                                  scountLike: listComment[index].countLike);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 15);
                            },
                          )),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                (changeSize
                    ? Positioned(
                  bottom: 10,
                      right: 20,
                      left: 20,
                      child: Common().buttonCommon(
                          textIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nhập bình luận  ',
                                style: TextStyles.textNotoSanMedium(14),
                              ),
                              SvgPicture.asset(IconConstant.penIcon)
                            ],
                          ),
                          callBack: () {
                            setState(() {
                              changeSize = false;
                            });
                          }),
                    )
                    : Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 20, 20),
                    color: CustomColors.yellowColor,
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              listComment.add(CommentModel(username: widget.usernameStr,comment: _commentController.text,countLike: widget.countLike));
                              _commentController.clear();
                              setState(() {});
                            },
                            icon: Icon(Icons.arrow_forward_ios)),
                        Expanded(
                            child:
                            TextFormField(
                              controller: _commentController,
                              onChanged: (value){
                              },
                              decoration: CustomStyles.inputDecorationBorder(
                                  borderColor: Colors.transparent,
                                  hintText: 'Aa',
                                  suffixIcon: const CustomIcon(IconConstant.makeIcon,)
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          );
        });
  }
}