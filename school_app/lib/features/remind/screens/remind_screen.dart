import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/features/home/blocs/home_bloc.dart';
import 'package:school_app/routers/app_router_name.dart';
import 'package:school_app/routers/fluro_navigator.dart';
import 'package:school_app/routers/router_generator.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/utilities/common.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/common_widget.dart';

import '../../../core/models/data_bundle.dart';
import '../../../utilities/assets_common.dart';
import '../../../utilities/text_styles.dart';

class RemindScreen extends StatefulWidget {
  const RemindScreen({Key? key}) : super(key: key);

  @override
  State<RemindScreen> createState() => _RemindScreenState();
}

class _RemindScreenState extends State<RemindScreen> {
  var _selectedIndex = 0 ;
  final _listItem = ['Nhắc nhở', 'Xin nghỉ'];
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarCommonV1(context,strTitle: 'Nhắc nhở' ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 55,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _listItem.length,
                    itemBuilder: (context, index){
                      return Container(
                        width:150,
                        margin: const EdgeInsets.only(left: 15),
                        child: Common().buttonCommon(
                            colors: _selectedIndex == index?CustomColors.yellowColor:CustomColors.yellowColor.withOpacity(0.5),
                            colorBorder:_selectedIndex == index? CustomColors.purpleColor:Colors.transparent,
                            textIcon: Text(_listItem[index], style: TextStyles.textInterMedium(18),),
                            callBack: (){
                              setState(() {
                                _selectedIndex = index;
                                pageController.animateToPage(_selectedIndex, duration: const Duration(milliseconds: 10), curve: Curves.bounceInOut);
                              });
                            }
                        ),
                      );
                    }),
              ),
              Expanded(
                  child: PageView(
                    controller: pageController,
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index){
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    children: const [
                      ListRemind(),
                      ListRest(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ListRemind extends StatelessWidget {
  const ListRemind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
        builder: (context,state){
        if(state.loading == true){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(state.error != null){
          return Center(
            child: Text(state.error??''),
          );
        }
        return Container(
          constraints: const BoxConstraints.expand(),
          child: ListView.builder(
            itemBuilder: (context, index){
              return SizedBox(
                height: 110,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Common().homeItemStudent(
                          avatarAssets: Images.avatarClass,
                          name: state.listClass![index],
                          subTitle: false,
                          text: '${state.listStudentClass![index].length} học sinh',
                        ),
                        onTap: (){
                          DataBundle data = DataBundle(listData: state.listStudentClass![index]);
                          context.goNamed(AppRouterName.remindListRouter, extra: data);
                        },
                      ),
                      const CustomUnderline(),
                    ]
                ),
              );
            },
            itemCount: state.listClass!.length,
          ),
        );
        });
  }
}

class ListRest extends StatelessWidget {
  const ListRest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
        builder: (context,state){
          if(state.loading == true){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state.error != null){
            return Center(
              child: Text(state.error??''),
            );
          }
          return Container(
            constraints: const BoxConstraints.expand(),
            child: ListView.builder(
              itemBuilder: (context, index){
                return SizedBox(
                  height: 110,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Common().homeItemStudent(
                          avatarAssets: Images.avatarClass,
                          name: state.listClass![index],
                          subTitle: false,
                          text: 'Xin nghỉ : 1 ',
                        ),
                       const CustomUnderline(),
                      ]
                  ),
                );
              },
              itemCount: state.listClass!.length,
            ),
          );
        });
  }
}
