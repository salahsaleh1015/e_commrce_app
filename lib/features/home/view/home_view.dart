import 'package:e_commerce_app/core/sevices/cache_services.dart';
import 'package:flutter/material.dart';

import '../../../core/component/custom_text.dart';
import '../../../core/style/colors.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(title: "home page", fontSize: 40, color: kTextColor, fontWeight: FontWeight.bold),
            TextButton(onPressed: ()async{
             await CacheHelper.clearData().then((value) {
               print("sss");
             });
            }, child: Text("clear")),
          ],
        ),
      ),
    );
  }
}
