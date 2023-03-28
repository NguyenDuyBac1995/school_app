import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/models/data_bundle.dart';
import 'package:school_app/features/login/blocs/login_bloc.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/common_widget.dart';

class RemindStudentScreen extends StatefulWidget {
  const RemindStudentScreen({Key? key}) : super(key: key);

  @override
  State<RemindStudentScreen> createState() => _RemindStudentScreenState();
}

class _RemindStudentScreenState extends State<RemindStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommonV1(context,strTitle: "Nhắc nhở",callback: (){Navigator.pop(context);}),
      body: SafeArea(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, state){
            if(state.loading == true){
              return const Center(
                child: CircularProgressIndicator(),
              );}
            else if (state.error != null){
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: state.listStudent!.length,
                  itemBuilder: (context, index){
                  return SizedBox(
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                        child: Common().homeItemStudent(
                      name: state.listStudent![index].name,
                      className: state.listStudent![index].className,
                      teacherName: 'Cô ${state.listStudent![index].teacherName}',
                      avatarAssets: state.listStudent![index].avata,
                    ),
                      onTap: (){
                      var data = DataBundle(data: state.listStudent![index]);
                      NavigatorUtils.push(context, RouterGenerator.routeRemindDetail,data: data);
                      },
                      ),
                        const CustomUnderline(),
                      ],
                    ),
                  );
                  }),
            );
          },
        )
      ),
    );
  }
}
