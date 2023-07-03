

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../cart/view/cart_view.dart';
import '../../home/view/home_view.dart';
import '../../profile/view/pofile_view.dart';


part 'control_state.dart';

class ControlCubit extends Cubit<ControlStates> {
  ControlCubit() : super(ControlInitialState());
  static ControlCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens =  [
    HomeView(),
     const CartView(),
    const ProfileView(),

   ];



  void changeIndex(int index){
     currentIndex = index;
     emit(BottomNavBarState());
  }




}
