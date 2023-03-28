import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/features/home/blocs/home_bloc.dart';
import 'package:school_app/features/infomation_profile/blocs/information_profile_bloc.dart';
import 'package:school_app/features/login/blocs/login_bloc.dart';
import 'package:school_app/features/main/screens/main_screen.dart';
import 'package:school_app/routers/app_router_name.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/custom_styles.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:school_app/widgets/logo_school/logo_school.dart';

import '../../../utilities/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: orientation == Orientation.portrait
              ? SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 10, top: 15),
                  reverse: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      GetLogo(),
                      GetLoginInput(),
                    ],
                  ),
                )
              : Row(
                  children: const [
                    Expanded(child: GetLogo()),
                    Expanded(
                      child: SingleChildScrollView(
                          reverse: true, child: GetLoginInput()),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class GetLoginInput extends StatefulWidget {
  const GetLoginInput({Key? key}) : super(key: key);

  @override
  State<GetLoginInput> createState() => _GetLoginInputState();
}

class _GetLoginInputState extends State<GetLoginInput> {
  @override
  Widget build(BuildContext context) {
    final textUsernameController = TextEditingController();
    final textPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    String username = "";
    String password = "";
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
      return Form(
        key: _formKey,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Đăng Nhập",
                style: TextStyles.textInterBold(34),
              ),
              const SizedBox(height: 26),
              TextFormField(
                style: TextStyles.textInterMedium(16),
                controller: textUsernameController,
                onChanged: (String value) {
                  username = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username không  hợp lệ";
                  }
                  if (state.usernameError == true) {
                    return "Username Không tồn tại";
                  }
                  return null;
                },
                decoration: CustomStyles.inputDecorationBorder(
                  fillColor: CustomColors.whiteColor,
                  hintText: 'Số điện thoại',
                  paddingSize: 22,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                style: TextStyles.textInterMedium(16),
                controller: textPasswordController,
                obscureText: !state.passwordVisible,
                onChanged: (String value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Mật khẩu không hợp lệ";
                  }
                  if (state.passwordError == true) {
                    return "Mật khẩu không trùng khớp";
                  }
                  return null;
                },
                decoration: CustomStyles.inputDecorationBorder(
                    fillColor: CustomColors.whiteColor,
                    hintText: 'Mật khẩu',
                    paddingSize: 22,
                    suffixIcon: IconButton(
                      icon: Icon(state.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        context
                            .read<LoginBloc>()
                            .add(TogglePasswordStatusChanged());
                      },
                    )),
              ),
              const SizedBox(height: 20),
              Common().buttonCommon(
                  textIcon: Text('Đăng nhập', style: TextStyles.textNotoSanMedium(14)),
                  callBack: (){
                    print('okok');
                    context.read<InformationProfileBloc>().add(
                        GetInformation(username: username, password: password));
                    context.read<HomeBloc>().add(GetTeacherHomeData());
                    context.read<LoginBloc>().add(LoginChanged(username: username, password: password));
                    Future.delayed(Duration(milliseconds: 500),(){
                      if (_formKey.currentState!.validate()) {
                        // NavigatorUtils.push(
                        //     context, RouterGenerator.routeMainScreen);
                        if(state.selectedRoad == 1){
                          context.goNamed(AppRouterName.homeRouter);
                        }else{
                          context.goNamed(AppRouterName.teacherHomeRouter);
                        }
                      }
                    });
                  }),
            ],
          ),
        ),
      );
    });
  }
}
