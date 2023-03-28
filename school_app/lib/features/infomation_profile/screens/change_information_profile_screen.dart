import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_app/features/infomation_profile/blocs/information_profile_bloc.dart';
import 'package:school_app/utilities/colors.dart';
import 'package:school_app/widgets/appbar/app_bar.dart';
import 'package:school_app/widgets/background_container.dart';
import 'package:school_app/widgets/common_widget.dart';
import 'package:school_app/widgets/image/avatar_image.dart';
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

  final ImagePicker picker = ImagePicker();
  File? image;
  Future<void> pickImage(ImageSource source) async{
    final XFile? pickedFile = await picker.pickImage(source: source);
    setState(() {
      if(pickedFile !=null){
        image = File(pickedFile.path);
      }else{
        print('No image selected');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context,strTitle: 'Thông tin cá nhân',callback: (){Navigator.pop(context);}),
        body: SafeArea(
          child: BlocBuilder<InformationProfileBloc, InformationProfileState>(
            builder: (BuildContext context, state){
              _nameController.text = state.information![0].name;
              _dateController.text = state.information![0].date;
              _genderController.text = state.information![0].gender == true ? 'Nam':'Nữ';
              _numberPhoneController.text = state.information![0].numberPhone;
              if(state.loading == true){
                return const Center(child: CircularProgressIndicator());
              }else if(state.error != null){
                return Center(child: Text(state.error??""));
              }
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: CustomColors.greenColor,
                      ),
                      child: Form(
                        key: _fromKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           image!=null?ImageWidget(image: image!, onClicked: (source)=>pickImage(source)):ImageWidget(image: File(state.information![0].avata) , onClicked:(source)=>pickImage(source)),
                            const SizedBox(height: 20),
                            FractionallySizedBox(
                              widthFactor: 0.45,
                              child: Common().buttonCommon(
                                height: 35,
                                border: 8,
                                textIcon: Text('Đổi ảnh đại diện', style: TextStyles.textInterMedium(14),),
                                callBack: ()async{
                                  final source = await showImageSource(context);
                                  if(source == null) return;
                                  pickImage(source);
                                }
                              ),
                            ),
                            const SizedBox(height: 10),
                            Common().profileItemCommon('Họ tên:',_nameController),
                            Common().profileItemCommon('Ngày sinh:',_dateController),
                            Common().profileItemCommon('Giới tính:',_genderController),
                            Common().profileItemCommon('SĐt:',_numberPhoneController)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Common().buttonCommon(
                        textIcon: Text('Lưu thông tin',style: TextStyles.textNotoSanMedium(18),),
                        callBack: (){
                          if(_fromKey.currentState!.validate()){
                            Common().showToastSuccess('Cập nhật thông tin thành công');
                          }
                        }
                    ),
                  ],
                ),
              );
            },
        )
        ),
      ),
    );
  }
}

