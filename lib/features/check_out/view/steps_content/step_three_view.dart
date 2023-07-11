import 'package:e_commerce_app/features/cart/view_model/cart_cubit.dart';
import 'package:e_commerce_app/features/check_out/view_model/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/component/custom_text.dart';
import '../../../../core/style/colors.dart';

class StepThreeView extends StatelessWidget {
   String streetOne , streetTwo, city;
   StepThreeView({ required this.streetOne, required this.streetTwo, required this.city});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCheckOutList(),
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              color: kTextColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              title: 'Shipping Address',
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    color: kTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    title:
                    " $streetOne $streetTwo $city",
                  ),
                ),
                Image.asset("assets/images/Checkbox.png")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: CustomText(
                title: 'change',
                fontWeight: FontWeight.normal,
                fontSize: 18.sp,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCheckOutList() => BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return SizedBox(
            height: 200.h,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: Image.network(cubit.cartProductModel[index].image,
                          fit: BoxFit.cover),
                    ),
                    CustomText(
                        title: cubit.cartProductModel[index].name,
                        fontSize: 20.sp,
                        color: kTextColor,
                        fontWeight: FontWeight.normal),
                    CustomText(
                        title: "\$${cubit.cartProductModel[index].price}",
                        fontSize: 18.sp,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.normal),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: cubit.cartProductModel.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
            ),
          );
        },
      );
}
