import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/features/home/blocs/home_bloc.dart';
import 'package:school_app/features/infomation_profile/blocs/information_profile_bloc.dart';
import 'package:school_app/features/login/blocs/login_bloc.dart';
import 'package:school_app/features/main/blocs/main_bloc.dart';
import 'package:school_app/features/school_class/blocs/school_class_bloc.dart';
import 'package:school_app/routers/app_router.dart';
import 'package:school_app/utilities/assets_common.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

void main() => runApp(
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // ),
  const MyApp(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(Images.backgroundImage), context);
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => MainBloc()),
      BlocProvider(create: (context) => LoginBloc()),
      BlocProvider(create: (context)=> HomeBloc()),
      BlocProvider(create: (context)=>InformationProfileBloc()),
      BlocProvider(create: (context)=>SchoolClassBloc())
    ], child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRouter().router,
      // initialRoute: RouterGenerator.routeSplashScreen,
      // onGenerateRoute: RouterGenerator.generateRoute,
    ));
  }
}






class ImageStoragePage extends StatefulWidget {
  @override
  _ImageStoragePageState createState() => _ImageStoragePageState();
}

class _ImageStoragePageState extends State<ImageStoragePage> {
  late SharedPreferences _prefs;
  List<String> _imageList = [];

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageList = _prefs.getStringList('images12') ?? [];
    });
  }

  Future<void> _addImage() async {
    final imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      List<int> imageBytes = await pickedFile.readAsBytes();
      String base64String = base64Encode(imageBytes);
      setState(() {
        _imageList.add(base64String);
      });
      developer.log('List: $_imageList');
      await _prefs.setStringList('image12', _imageList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Storage'),
      ),
      body: ListView.builder(
        itemCount: _imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.memory(base64Decode(_imageList[index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addImage,
        tooltip: 'Add Image',
        child: Icon(Icons.add),
      ),
    );
  }
}


