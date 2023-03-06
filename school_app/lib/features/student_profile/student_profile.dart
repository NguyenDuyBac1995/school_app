import 'package:flutter/material.dart';
import 'package:school_app/data/dummy_data.dart';

import '../../utilities/assets_common.dart';
import '../../utilities/colors.dart';
import '../../utilities/common.dart';
import '../../utilities/components/common_font.dart';
import '../../utilities/text_styles.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _schoolController = TextEditingController();
  final _classController = TextEditingController();
  final _parentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = dummyData[0].name;
    _dateController.text = dummyData[0].date;
    _schoolController.text = dummyData[0].school;
    _classController.text = dummyData[0].class_studen;
    _parentController.text = dummyData[0].parent;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomColors.mainTabColor,
            ),
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  CircleAvatar(child: CustomIcon(Images.homeItemRight, size: 80),radius: 65, backgroundColor: Colors.white,),
                  SizedBox(height: 20),
                  // FractionallySizedBox(
                  //   widthFactor: 0.45,
                  //   child: Common().buttonCommon(
                  //     height: 35,
                  //     border: 8,
                  //     textIcon: Text('Đổi ảnh đại diện', style: TextStyles.textInterMedium(14),),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('Họ tên:', style: TextStyles.textInterMedium(18),)),
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Common().commentTextField(
                                veticalSize: 12,
                                controller: _nameController,
                                sizeBorder: 12,
                                textStyle: TextStyles.textInterMedium(16),
                                colorBorder: CustomColors.textColor,
                                validation: true,
                                validationErrorMsg: 'Hãy nhập thông tin đầy đủ'
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('Ngày sinh:', style: TextStyles.textInterMedium(18),)),
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Common().commentTextField(
                                veticalSize: 12,
                                controller: _dateController,
                                sizeBorder: 12,
                                textStyle: TextStyles.textInterMedium(16),
                                colorBorder: CustomColors.textColor,
                                validation: true,
                                validationErrorMsg: 'Hãy nhập thông tin đầy đủ'
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('Trường:', style: TextStyles.textInterMedium(18),)),
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Common().commentTextField(
                                veticalSize: 12,
                                controller: _schoolController,
                                sizeBorder: 12,
                                textStyle: TextStyles.textInterMedium(16),
                                colorBorder: CustomColors.textColor,
                                validation: true,
                                validationErrorMsg: 'Hãy nhập thông tin đầy đủ'
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('Lớp:', style: TextStyles.textInterMedium(18),)),
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Common().commentTextField(
                                veticalSize: 12,
                                controller: _classController,
                                sizeBorder: 12,
                                textStyle: TextStyles.textInterMedium(16),
                                colorBorder: CustomColors.textColor,
                                validation: true,
                                validationErrorMsg: 'Hãy nhập thông tin đầy đủ'
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('Phụ huynh:', style: TextStyles.textInterMedium(18),)),
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Common().commentTextField(
                                veticalSize: 12,
                                controller: _parentController,
                                sizeBorder: 12,
                                textStyle: TextStyles.textInterMedium(16),
                                colorBorder: CustomColors.textColor,
                                validation: true,
                                validationErrorMsg: 'Hãy nhập thông tin đầy đủ'
                            )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Common().buttonCommon(
                textIcon: Text('Lưu thông tin',style: TextStyles.textNotoSanMedium(18),),
                callBack: (){
                  if(_fromKey.currentState!.validate()){
                    Common().showToastSuccess('Cập nhật thông tin thành công');
                  }
                }
            ),
          )
        ],
      ),
    );
  }
}

class _fromKey {
}

