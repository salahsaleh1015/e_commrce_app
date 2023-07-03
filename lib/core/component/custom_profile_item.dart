import 'package:e_commerce_app/core/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/colors.dart';

class CustomProfileItem extends StatelessWidget {
  final String  text , image;
  final VoidCallback onTap;

  const CustomProfileItem({ required this.text , required this.onTap ,required this.image});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color:Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Image.asset(image)),
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                  title:text,
                  color: kTextColor,
                  fontSize:  20.sp,
                  fontWeight: FontWeight.normal
              ),

              const Spacer(),
              IconButton(onPressed: onTap, icon:  Icon(Icons.arrow_forward_ios,
                color: kTextColor ,

              ))

            ],
          ),
          SizedBox(height: 15.h,)
        ],
      ),
    );
  }
}