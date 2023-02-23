import 'package:flutter/material.dart';
import 'package:school_app/features/main/screens/main_screen.dart';

class RouterGenerator {
  // Router List
  static const routeLoginScreen = '/login';
  static const routeMainScreen = '/main';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const Text('login screen'));
      case routeMainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
    // return MaterialPageRoute(builder: (_) => const MainScreen());
  }
}
