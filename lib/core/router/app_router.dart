import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import '../../features/authintication/view/login_view.dart';
import '../../features/authintication/view/register_view.dart';
import '../constants/screens_names.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
     startScreen =  LoginView();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case ScreensNames.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case ScreensNames.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case ScreensNames.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return null;
    }
    }
  }
