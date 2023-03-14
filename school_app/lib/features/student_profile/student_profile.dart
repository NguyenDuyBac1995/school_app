import 'package:flutter/material.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/utilities/custom_styles.dart';

import '../../utilities/assets_common.dart';
import '../../utilities/colors.dart';
import '../../utilities/common.dart';
import '../../widgets/common_widget.dart';
import '../../utilities/text_styles.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key , required this.dataStudent}) : super(key: key);
 final Student dataStudent;
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
    _nameController.text = widget.dataStudent.name;
    _dateController.text = widget.dataStudent.date;
    _schoolController.text = widget.dataStudent.school;
    _classController.text = widget.dataStudent.class_studen;
    _parentController.text = widget.dataStudent.parent;
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
              color: CustomColors.greenColor,
            ),
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  CircleAvatar(child: CustomIcon(Images.homeItemRight, size: 80),radius: 65, backgroundColor: Colors.white,),
                  SizedBox(height: 20),
                  Common().profileItemCommon('Họ tên',_nameController ),
                  Common().profileItemCommon('Ngày sinh:',_dateController ),
                  Common().profileItemCommon('Trường',_schoolController ),
                  Common().profileItemCommon('Lớp',_classController ),
                  Common().profileItemCommon('Phụ huynh',_parentController ),
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
