import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/features/login/blocs/login_bloc.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/custom_styles.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../../utilities/assets_common.dart';
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
            padding: EdgeInsets.only(bottom: 10),
            reverse: true,
                child: Column(
                    children: const [
                      GetLoginImages(),
                      GetLoginInput()
                    ],
                  ),
              )
              : Row(
                  children: [
                    Expanded(child: GetLoginImages()),
                    Expanded(
                      child: GetLoginInput(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class GetLoginImages extends StatelessWidget {
  const GetLoginImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.7,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        child: SvgPicture.asset(
          Images.splashImage,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

class GetLoginInput extends StatelessWidget {
  const GetLoginInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text(
              "Đăng Nhập",
              style: TextStyles.textInterBold(34),
            ),
            SizedBox(height: 26),
            _UsernameInput(),
            SizedBox(height: 15),
            _PasswordInput(),
            SizedBox(height: 20),
            Common().buttonCommon(
                textIcon: Text('Đăng nhập',
                    style: TextStyles.textNotoSanMedium(14)),
                callBack: () {
                  if (_formKey.currentState!.validate()) {
                    NavigatorUtils.push(
                        context, RouterGenerator.routeMainScreen);
                  }
                  ;
                })
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  final _textUsernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.username != current.username,
        builder: (context, state) {
          return TextFormField(
            style: TextStyles.textInterMedium(16),
            controller: _textUsernameController,
            onChanged: (value) {
              context.read<LoginBloc>().add(LoginUsernameChanged(value));
            },
            validator: (value) =>
                value!.isEmpty ? 'Hãy nhập tên hoặc số điện thoại' : null,
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
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.passwordVisible != current.passwordVisible,
        builder: (context, state) {
          return TextFormField(
            style: TextStyles.textInterMedium(16),
            controller: _textPasswordController,
            obscureText: !state.passwordVisible,
            onChanged: (value) {
              context.read<LoginBloc>().add(LoginPasswordChanged(value));
            },
            validator: (value) =>
                value!.isEmpty ? 'Mật khẩu không hợp lệ' : null,
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
          );
        });
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:school_app/features/login/blocs/login_bloc.dart';
// import 'package:school_app/routers/fluro_navigator.dart';
// import 'package:school_app/routers/router_generator.dart';
// import 'package:school_app/utilities/colors.dart';
// import 'package:school_app/utilities/custom_styles.dart';
// import 'package:school_app/widgets/background_container.dart';
// import 'package:school_app/widgets/common_widget.dart';
//
// import '../../../utilities/assets_common.dart';
// import '../../../utilities/text_styles.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _textUserController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return MainContainer(
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                   height: MediaQuery.of(context).size.width * 0.6,
//                   width: MediaQuery.of(context).size.width * 0.6,
//                   child: SvgPicture.asset(
//                     Images.splashImage,
//                     fit: BoxFit.cover,
//                     alignment: Alignment.center,
//                   ),
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Expanded(flex: 2, child: SizedBox()),
//                             Expanded(child: SizedBox()),
//                             Text(
//                               "Đăng Nhập",
//                               style: TextStyles.textInterBold(34),
//                             ),
//                             SizedBox(height: 26),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 _UsernameInput(),
//                                 SizedBox(height: 15),
//                                 _PasswordInput(),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(bottom: 20)                ,
//                                   child: Align(
//                                     alignment: Alignment.bottomCenter,
//                                     child: Common().buttonCommon(
//                                         textIcon: Text('Đăng nhập',
//                                             style: TextStyles.textNotoSanMedium(14)),
//                                         callBack: () {
//                                           if (_formKey.currentState!.validate()) {
//                                             NavigatorUtils.push(context,
//                                                 RouterGenerator.routeMainScreen);
//                                           }
//                                           ;
//                                         }),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )),
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _UsernameInput extends StatelessWidget {
//   final _textUsernameController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//         buildWhen: (previous, current) => previous.username != current.username,
//         builder: (context, state) {
//           return TextFormField(
//             style: TextStyles.textInterMedium(16),
//             controller: _textUsernameController,
//             onChanged: (value) {
//               context.read<LoginBloc>().add(LoginUsernameChanged(value));
//             },
//             validator: (value) =>
//                 value!.isEmpty ? 'Hãy nhập tên hoặc số điện thoại' : null,
//             decoration: CustomStyles.inputDecorationBorder(
//               fillColor: CustomColors.whiteColor,
//               hintText: 'Số điện thoại',
//               paddingSize: 22,
//             ),
//           );
//         });
//   }
// }
//
// class _PasswordInput extends StatelessWidget {
//   final _textPasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//         buildWhen: (previous, current) =>
//             previous.passwordVisible != current.passwordVisible,
//         builder: (context, state) {
//           return TextFormField(
//             style: TextStyles.textInterMedium(16),
//             controller: _textPasswordController,
//             obscureText: !state.passwordVisible,
//             onChanged: (value) {
//               context.read<LoginBloc>().add(LoginPasswordChanged(value));
//             },
//             validator: (value) =>
//                 value!.isEmpty ? 'Mật khẩu không hợp lệ' : null,
//             decoration: CustomStyles.inputDecorationBorder(
//                 fillColor: CustomColors.whiteColor,
//                 hintText: 'Mật khẩu',
//                 paddingSize: 22,
//                 suffixIcon: IconButton(
//                   icon: Icon(state.passwordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off),
//                   onPressed: () {
//                     context
//                         .read<LoginBloc>()
//                         .add(TogglePasswordStatusChanged());
//                   },
//                 )),
//           );
//         });
//   }
// }
