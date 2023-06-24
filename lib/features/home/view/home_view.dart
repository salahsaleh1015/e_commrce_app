import 'package:flutter/material.dart';

import '../../../core/component/custom_text.dart';
import '../../../core/style/colors.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: CustomText(title: "home page", fontSize: 40, color: kTextColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
