import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String image;
  final GestureTapCallback onTap;

  const CustomSocialButton({super.key,  required this.text, required this.image ,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
              ),
              Center(
                child: Text(text),
              )
            ],
          ),
        ),
      ),
    );
  }
}