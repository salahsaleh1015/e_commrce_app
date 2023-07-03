
import 'package:e_commerce_app/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/component/custom_text.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/style/colors.dart';
import '../../home/model/product_model.dart';


class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLandscape(context)
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: buildDetailsContent(context),
            )
          : buildDetailsContent(context),
    );
  }

  Widget buildDetailsContent(context) {
    return BlocConsumer<HomeCubit, HomeStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = HomeCubit.get(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300.h,
            child: Image.network(model.image),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            width: MediaQuery.of(context).size.width,
            height: 350.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: model.name,
                  color: kTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  title: "Details",
                  color: kTextColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: CustomText(
                      title:
                      model.description,
                          fontSize: 20.sp,
                      color: kTextColor,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomText(
                              title: 'price',
                              fontSize: 20.sp,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.normal),
                          CustomText(
                              title: "\$ ${model.price}",
                              fontSize: 20.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ],
                      ),

                      Container(
                        width: 100.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimaryColor,
                        ),
                        child: Center(
                            child: CustomText(

                                title: "ADD",
                                fontWeight: FontWeight.normal,
                                fontSize: 20.sp,
                                color: Colors.white,

                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  },
);
  }
}
