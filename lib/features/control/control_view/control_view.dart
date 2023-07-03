import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/colors.dart';
import '../cubit/control_cubit.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlCubit, ControlStates>(
      builder: (context, state) {
        var cubit = ControlCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            // buttonBackgroundColor:kPrimaryColor ,
            backgroundColor: Colors.transparent,
            color: Colors.grey.shade100,
            items:  <Widget>[
              Icon(Icons.home, size: 30.r, color: kPrimaryColor),

              Icon(Icons.card_travel_outlined, size: 30.r, color: kPrimaryColor),
              Icon(Icons.person, size: 30.r, color: kPrimaryColor),
            ],
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
