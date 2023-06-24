import 'package:e_commerce_app/core/component/custom_text.dart';
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;



  const CustomButton({required this.title , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
          color:kPrimaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child:  Center(
          child:
          CustomText(
            color:kLightColor ,
            fontSize: 20.sp,
            fontWeight: FontWeight.normal,
            title: title,
          ),

        ),
      ),
    );
  }
}