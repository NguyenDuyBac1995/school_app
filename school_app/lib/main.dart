import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/features/login/blocs/login_bloc.dart';
import 'package:school_app/features/main/blocs/main_bloc.dart';
import 'package:school_app/routers/router_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => MainBloc()),
      BlocProvider(create: (context) => LoginBloc()),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouterGenerator.routeSplashScreen,
      onGenerateRoute: RouterGenerator.generateRoute,
    ));
  }
}


