import 'package:flutter/material.dart';

import '../presentation/authentication/sign_in/sign_in.dart';
import '../presentation/home/home.dart';


class AppRoutes {
  static const home = '/home';
  static const signIn = '/signIn';

}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // E.g Navigator.of(context).pushNamed(AppRoutes.theScreenYouAreGoingTo);
    switch (settings.name) {
      case AppRoutes.signIn:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>  SignInScreen(),
          settings: settings,
        );
        case AppRoutes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>  HomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
          settings: settings,
        );
    }
  }
}
