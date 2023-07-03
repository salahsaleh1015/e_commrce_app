
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/component/custom_profile_item.dart';
import '../../../core/component/custom_text.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/style/colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: isLandscape(context)?SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: buildProfileContent(context),
      ): buildProfileContent(context),
    ));
  }
  Widget buildProfileContent(context){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Image.asset("assets/images/Avatar.png"),
                radius:isLandscape(context)?60.r: 50.r,

              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                children:  [
                  CustomText(
                    title:"fabrizio Dos santos",
                    fontSize: isLandscape(context)?30.sp :20.sp,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,

                  ),
                  CustomText(
                    title:"fabrizioDosSantos@gmail.com",
                    fontSize:isLandscape(context)?15.sp :10.sp,
                    fontWeight: FontWeight.normal,
                    color: kSecondaryColor,

                  ),


                  SizedBox(
                    height: 5.h,
                  ),

                ],
              )
            ],
          ),

          SizedBox(
            height: 30.h,
          ),
          CustomProfileItem(
            onTap: () {},
            image: "assets/images/Group 186.png",
            text: 'Edit Profile',
          ),
          CustomProfileItem(
            onTap: () {},
            image: "assets/images/Group 185.png",
            text: 'Shipping Address',
          ),
          CustomProfileItem(
            onTap: () {},
            image: "assets/images/Group 194.png",
            text: "Order History",
          ),
          CustomProfileItem(
            onTap: () {},
            image: "assets/images/Group 197.png",
            text: 'Cards',
          ),
          CustomProfileItem(
            onTap: () {},
            image: "assets/images/Group 198.png",
            text: 'Notifications',
          ),
          CustomProfileItem(
            onTap: () {},
            image: "assets/images/Group 200.png",
            text:'Log Out',
          ),
        ],
      ),
    );
  }
}
