import 'package:e_commerce_app/features/control/control_view/control_view.dart';
import 'package:e_commerce_app/features/details/view/details_view.dart';
import 'package:e_commerce_app/features/home/model/product_model.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import '../../features/authintication/view/login_view.dart';
import '../../features/authintication/view/register_view.dart';
import '../../features/check_out/view/check_out_view.dart';
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
        return MaterialPageRoute(builder: (_) =>  HomeView());
      case ScreensNames.control:
        return MaterialPageRoute(builder: (_) =>  const ControlView());
      case ScreensNames.checkOut:
        return MaterialPageRoute(builder: (_) => CheckOutView());

      // case ScreensNames.details:
      //   return MaterialPageRoute(builder: (_) =>   DetailsView(model: ProductModel(),));

      default:
        return null;
    }
    }
  }
