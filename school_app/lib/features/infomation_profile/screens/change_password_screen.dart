import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/features/infomation_profile/blocs/information_profile_bloc.dart';
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
  RegExp PasswordRegExp =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');


  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context, strTitle: 'Đổi mật khẩu',callback: (){Navigator.pop(context);}),
        body: SafeArea(
          child: SingleChildScrollView(child:
              BlocBuilder<InformationProfileBloc, InformationProfileState>(
            builder: (BuildContext context, state) {
              if (state.loading == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(state.error != null){
                return Center(
                  child:  Text(state.error??''),
                );
              }
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: CustomColors.greenColor,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: _textPassword,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Hãy nhập đầy đủ thông tin';
                                  }if(value != state.information![0].password){
                                    return 'Mật khẩu không chính xác';
                                  }
                                  return null;
                                },
                                decoration: CustomStyles.inputDecorationBorder(
                                    hintText: 'Mật khẩu hiện tại',
                                    paddingSize: 22,
                                    hintSize: 18
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: _textChangePassword,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Hãy nhập đầy đủ thông tin';
                                  }if(!PasswordRegExp.hasMatch(value)){
                                    return "Mật khẩu không hợp lệ , phải chứa 6 ký tự chứa số và chữ Hoa trở lên";
                                  }
                                  return null;
                                },
                                decoration: CustomStyles.inputDecorationBorder(
                                    hintText: 'Mật khẩu mới',
                                    paddingSize: 22,
                                    hintSize: 18
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: _textDefinePassword,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Hãy nhập đầy đủ thông tin';
                                  }if(value != _textChangePassword.text){
                                    return 'Mật Khẩu không trùng khớp';
                                  }
                                  return null;
                                },
                                decoration: CustomStyles.inputDecorationBorder(
                                    hintText: 'Xác nhận mật khẩu',
                                    paddingSize: 22,
                                    hintSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Common().buttonCommon(
                            textIcon: Text('Lưu thông tin', style: TextStyles.textNotoSanMedium(16),),
                            callBack: (){
                              if(_fromKey.currentState!.validate()){
                                _textChangePassword.clear();
                                _textPassword.clear();
                                _textDefinePassword.clear();
                                Common().showToastSuccess('Thay đổi mật khẩu thành công') ;
                              }
                            }
                        )
                      ],
                    ),
                  )
              );
            },
          )),
        ),
      ),
    );
  }
}
