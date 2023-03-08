

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/features/login/blocs/login_bloc.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/custom_styles.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../../utilities/assets_common.dart';
import '../../../utilities/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textUserController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Common().logoScreen(),
            SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(flex: 2,child: SizedBox()),
                            Container(
                              height: MediaQuery.of(context).size.width*0.6,
                              width: MediaQuery.of(context).size.width*0.6,
                              child: SvgPicture.asset(
                                Images.splashImage,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              "Đăng Nhập", style: TextStyles.textInterBold(34),
                            ),
                            SizedBox(height: 26),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _UsernameInput(),
                                SizedBox(height: 15),
                                _PasswordInput(),
                                SizedBox(height: 30),
                                _getText(context),
                                SizedBox(height: 10,),
                                Common().buttonCommon(
                                    textIcon: Text('Đăng nhập', style: TextStyles.textNotoSanMedium(14)),
                                    callBack: (){
                                      if(_formKey.currentState!.validate()){
                                        NavigatorUtils.push(context, RouterGenerator.routeMainScreen);
                                      };
                                    }
                                )
                              ],
                            ),
                          )),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
  BlocBuilder<LoginBloc, LoginState> _getText(BuildContext context){
    return BlocBuilder<LoginBloc,LoginState>(
      buildWhen: (previous, current) => previous.username != current.username || previous.password != current.password,
        builder: (BuildContext context, LoginState state){
          return Text('${state.username} va ${state.password} va ${state.passwordVisible}');
        });
  }
}

class _UsernameInput extends StatelessWidget {
 final _textUsernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
        buildWhen: (previous, current)=> previous.username != current.username,
        builder: (context, state){
          return TextFormField(
            style: TextStyles.textInterMedium(16),
            controller: _textUsernameController,
            onChanged: (value){
              context.read<LoginBloc>().add(LoginUsernameChanged(value));
            },
            validator: (value)=>value!.isEmpty?'Hãy nhập tên hoặc số điện thoại':null,
            decoration: CustomStyles.inputDecorationBorder(
                fillColor: CustomColors.whiteColor,
                hintText: 'Số điện thoại',
                paddingSize: 22,
            ),
          );
        });
  }
}


class _PasswordInput extends StatelessWidget {
  final _textPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      buildWhen: (previous, current)=> previous.passwordVisible != current.passwordVisible,
        builder: (context, state){
          return TextFormField(
              style: TextStyles.textInterMedium(16),
              controller: _textPasswordController,
              obscureText: !state.passwordVisible,
              onChanged: (value){
                context.read<LoginBloc>().add(LoginPasswordChanged(value));
              },
            validator: (value)=>value!.isEmpty?'Mật khẩu không hợp lệ':null,
            decoration: CustomStyles.inputDecorationBorder(
              fillColor: CustomColors.whiteColor,
              hintText: 'Mật khẩu',
              paddingSize: 22,
              suffixIcon: IconButton(
                icon: Icon(state.passwordVisible ? Icons.visibility: Icons.visibility_off),
                onPressed: () {
                  context.read<LoginBloc>().add(TogglePasswordStatusChanged());
                },)
            ),
          );
        });
  }
}

