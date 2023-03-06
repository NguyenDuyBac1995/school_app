import 'package:flutter/material.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/components/common_font.dart';

import '../../../utilities/components/app_bar.dart';
import '../../../utilities/text_styles.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _textPassword = TextEditingController();
  final _textChangePassword = TextEditingController();
  final _textDefinePassword = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommonV1(context,strTitle: 'Đổi mật khẩu'),
      body: SafeArea(
        child: Stack(
          children: [
            Common().logoScreen(),
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: CustomColors.mainTabColor,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Common().commentTextField(
                                controller: _textPassword,
                                colorBorder: CustomColors.textColor,
                                validation: true,
                                validationErrorMsg: 'Hãy nhập đầy đủ thông tin',
                                hintValue: 'Mật khẩu hiện tại',
                                hintStyle: TextStyles.textPoppinMedium(18),
                              ),
                              SizedBox(height: 15),
                              Common().commentTextField(
                                controller: _textChangePassword,
                                colorBorder: CustomColors.textColor,
                                validation: true,
                                validationErrorMsg: 'Hãy nhập đầy đủ thông tin',
                                hintValue: 'Mật khẩu mới',
                                hintStyle: TextStyles.textPoppinMedium(18),
                              ),
                              SizedBox(height: 15),
                              Common().commentTextField(
                                controller: _textDefinePassword,
                                colorBorder: CustomColors.textColor,
                                validation: true,
                                validationErrorMsg: 'Hãy nhập đầy đủ thông tin',
                                hintValue: 'Xác nhận mật khẩu',
                                hintStyle: TextStyles.textPoppinMedium(18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                        Common().buttonCommon(
                            textIcon: Text('Lưu thông tin', style: TextStyles.textNotoSanMedium(16),),
                            callBack: (){
                              if(_fromKey.currentState!.validate()){
                                Common().showToastSuccess('Thay đổi mật khẩu thành công') ;
                              }
                            }
                        )
                      ],
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
