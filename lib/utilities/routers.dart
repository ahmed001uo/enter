import 'package:cscscsaa/utilities/routes.dart';
import 'package:cscscsaa/views/forget_password.dart';
import 'package:cscscsaa/views/home_page.dart';
import 'package:cscscsaa/views/login_page.dart';
import 'package:cscscsaa/views/register_page.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.forgetPasswordPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const ForgetPasswordPage(),
        settings: settings,
      );
    case AppRoutes.registerPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const RegisterPage(),
        settings: settings,
      );

    case AppRoutes.homePageRoute:
      return CupertinoPageRoute(
        builder: (_) => const HomePage(),
        settings: settings,
      );

  
    default:
       return CupertinoPageRoute(
        builder: (_) => const LoginPage(),
        settings: settings,
      );
  }
}
