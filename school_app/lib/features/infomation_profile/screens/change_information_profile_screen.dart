import 'package:flutter/material.dart';
import 'package:school_app/data/dummy_data.dart';
import 'package:school_app/utilities/assets_common.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../../utilities/text_styles.dart';

class ChangeInformationScreen extends StatefulWidget {
  const ChangeInformationScreen({Key? key}) : super(key: key);

  @override
  State<ChangeInformationScreen> createState() => _ChangeInformationScreenState();
}

class _ChangeInformationScreenState extends State<ChangeInformationScreen> {
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _genderController = TextEditingController();
  final _numberPhoneController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = dummyData[0].name;
    _dateController.text = dummyData[0].date;
    _genderController.text = dummyData[0].gender;
    _numberPhoneController.text = dummyData[0].numberPhone;
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context,strTitle: 'Thông tin cá nhân'),
        body: SafeArea(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(child: CustomIcon(Images.homeItemRight, size: 80),radius: 65, backgroundColor: Colors.white,),
                      SizedBox(height: 20),
                      FractionallySizedBox(
                        widthFactor: 0.45,
                        child: Common().buttonCommon(
                          height: 35,
                          border: 8,
                          textIcon: Text('Đổi ảnh đại diện', style: TextStyles.textInterMedium(14),),
                        ),
                      ),
                      SizedBox(height: 10),
                      Common().profileItemCommon('Họ tên:',_nameController),
                      Common().profileItemCommon('Ngày sinh:',_dateController),
                      Common().profileItemCommon('Giới tính:',_genderController),
                      Common().profileItemCommon('SĐt:',_numberPhoneController)
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}