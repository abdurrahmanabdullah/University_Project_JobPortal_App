import 'package:ecommerce/ui/views/Authentication/signIn_view.dart';
import 'package:ecommerce/ui/views/Authentication/signUp_view.dart';
import 'package:ecommerce/ui/views/get_view.dart';
import 'package:ecommerce/ui/views/profile_view.dart';
import 'package:ecommerce/ui/views/registration.dart';
import 'package:flutter/material.dart';

class RouteNavigation {
  static const String registration = 'registration';
  static const String signUp = 'signUp';
  static const String signIn = 'signIn';
  static const String get = 'get';
  static const String profile = 'profile';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case registration:
        return MaterialPageRoute(builder: (context) => const Registration());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case signIn:
        return MaterialPageRoute(builder: (context) => const SignInView());
      case get:
        return MaterialPageRoute(builder: (context) => const GetView());

      case profile:
        return MaterialPageRoute(builder: (context) => const ProfileView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
