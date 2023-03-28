import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_app/core/models/post_model.dart';
import 'package:school_app/features/infomation_profile/blocs/information_profile_bloc.dart';
import 'package:school_app/features/school_class/blocs/school_class_bloc.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/utilities/custom_styles.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/image/grid_image.dart';

import '../../../utilities/text_styles.dart';
import 'dart:developer' as developer;

class CreatePostsScreen extends StatefulWidget {
  const CreatePostsScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostsScreen> createState() => _CreatePostsScreenState();
}

class _CreatePostsScreenState extends State<CreatePostsScreen> {
  final textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  List<XFile> _medias = [];
  List<String> imageBase64String = [];

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _pickMultiImage() async {
    final List<XFile> multiImage = await _picker.pickMultiImage();
    // if(multiImage != null){
    //   setState(() {
    //     _medias = multiImage;
    //   });
    //
    // }
    await convertImagesToBase64(multiImage);
  }

  Future<void> convertImagesToBase64(List<XFile> medias)async{
    List<String> base64Strings = [];
    for(XFile imageFile in medias){
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64String = base64Encode(imageBytes);
      base64Strings.add(base64String);
    }
    setState(() {
      imageBase64String = base64Strings;
    });
    developer.log('data : ${imageBase64String}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarCommonV1(context, strTitle: 'Tạo bài viết', callback: () {
          Navigator.pop(context);
        }),
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xffF4F8FE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 200,
                            child: TextFormField(
                              style: TextStyles.textInterMedium(20),
                              controller: textController,
                              maxLines: 10,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Bạn đang nghĩ gì?',
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GridImage(image: imageBase64String),
                        ],
                      )),
                  BlocBuilder<InformationProfileBloc, InformationProfileState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<SchoolClassBloc>().add(CreatePostEvent(
                            context: context,
                                  postNew: PostModel(
                                    avataStr: state.information![0].avata,
                                    name: state.information![0].name,
                                    content: textController.text,
                                    listImage: imageBase64String,
                              )));
                         Navigator.pop(context);
                        },
                        child: Container(
                          height: 60,
                          width: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            'Đăng',
                            style: TextStyles.textInterMedium(18)
                                .copyWith(color: Colors.white),
                          )),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 80,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(width: 0.5, color: Colors.grey))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: IconButton(
                              onPressed: () {
                                // _pickImage(ImageSource.gallery);
                                _pickMultiImage();
                              },
                              icon: const Icon(Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                  size: 40,
                                  opticalSize: 0.3),
                            )),
                        Expanded(
                          child: TextFormField(
                            decoration: CustomStyles.inputDecorationBorder(
                                fillColor: Color(0xffF4F8FE),
                                borderColor: Colors.transparent,
                                suffixIcon: CustomIcon(
                                  IconConstant.makeIcon,
                                )),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Gửi',
                              style: TextStyles.textInterMedium(18)
                                  .copyWith(color: Colors.blue),
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
