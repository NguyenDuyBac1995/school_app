import 'package:flutter/material.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/custom_styles.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../../widgets/appbar/app_bar.dart';
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
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context,strTitle: 'Đổi mật khẩu'),
        body: SafeArea(
          child: SingleChildScrollView(
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
                          color: CustomColors.greenColor,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: _textPassword,
                              validator: (value)=>value!.isEmpty?'Hãy nhập đầy đủ thông tin':null,
                              decoration: CustomStyles.inputDecorationBorder(
                                hintText: 'Mật khẩu hiện tại',
                                paddingSize: 22,
                                hintSize: 18
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _textChangePassword,
                              validator: (value)=>value!.isEmpty?'Hãy nhập đầy đủ thông tin':null,
                              decoration: CustomStyles.inputDecorationBorder(
                                  hintText: 'Mật khẩu mới',
                                  paddingSize: 22,
                                  hintSize: 18
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _textDefinePassword,
                              validator: (value)=>value!.isEmpty?'Hãy nhập đầy đủ thông tin':null,
                              decoration: CustomStyles.inputDecorationBorder(
                                  hintText: 'Xác nhận mật khẩu',
                                  paddingSize: 22,
                                  hintSize: 18
                              ),
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
          ),
        ),
      ),
    );
  }
}
