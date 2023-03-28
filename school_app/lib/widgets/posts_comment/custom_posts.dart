import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/image/grid_image.dart';
import '../../utilities/assets_common.dart';
import '../../utilities/colors.dart';
import '../../utilities/text_styles.dart';

class PostStyles extends StatelessWidget {
  const PostStyles({Key? key, this.nameUserPosts,this.avatarUserPost, this.callbackComment, this.colorIcon, this.listUserLike, this.callbackLike, this.listStr, this.content, this.listImage}) : super(key: key);
  final String? nameUserPosts;
  final String? avatarUserPost;
  final VoidCallback? callbackComment;
  final VoidCallback? callbackLike;
  final bool? colorIcon;
  final int? listUserLike;
  final String? listStr;
  final String? content;
  final List<String>? listImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 17),
      decoration: BoxDecoration(
          color: CustomColors.greenColor,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        backgroundImage: NetworkImage(avatarUserPost!),
                        radius: 26),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameUserPosts??'',
                          style: TextStyles.textNotoSanBold(16),
                        ),
                       const SizedBox(height: 3),
                        Text(
                          '18:01 19/8/2020',
                          style: TextStyles.textNotoSanMedium(14),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(content??'', style: TextStyles.textNotoSanMedium(16)),
              ],
            ),
            const SizedBox(height: 10),
            GridImage(image: listImage!),
            const SizedBox(height: 8),
            Container(
              height: 1.5,
              width: MediaQuery.of(context).size.width,
              color: CustomColors.purpleColor,
            ),
            const SizedBox(height: 5),
            Text(listStr??'', style: TextStyles.textInterMedium(16),),
            const SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width * 0.88,
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: callbackLike,
                          child: CustomIcon(IconConstant.likeIcon,size: 30, color: colorIcon==true?Colors.pinkAccent:CustomColors.purpleColor,)),
                      Text(
                        listUserLike.toString(),
                        style: TextStyles.textNotoSanMedium(14),
                      )
                    ],
                  ),
                  Row(
                    children: [
                     const CustomIcon(IconConstant.statusHeathIcon,size: 30),
                      Text(
                        '12',
                        style: TextStyles.textNotoSanMedium(14),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: callbackComment!,
                    child:  Row(children: [
                     const CustomIcon(IconConstant.commentIcon,size: 30),
                      Text('20', style: TextStyles.textNotoSanMedium(14),
                      )
                    ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

