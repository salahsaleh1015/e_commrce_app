import 'package:e_commerce_app/core/router/app_router.dart';
import 'package:e_commerce_app/core/sevices/cache_services.dart';
import 'package:e_commerce_app/core/style/themes.dart';
import 'package:e_commerce_app/features/authintication/view_model/auth_cubit.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/style/colors.dart';
import 'features/authintication/view/login_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  final firebaseToken = await CacheHelper.getData(key: "firebase_token");
  runApp(MyApp(
    firebaseToken: firebaseToken,
  ));
}

class MyApp extends StatelessWidget {
  final String? firebaseToken;
  const MyApp({Key? key, this.firebaseToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: kBackGroundColor,
              statusBarIconBrightness: Brightness.dark,
            ));
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              onGenerateRoute: AppRouter().onGenerateRoute,
              home: firebaseToken != null ? HomeView() : LoginView(),
            );
          }),
    );
  }
}
