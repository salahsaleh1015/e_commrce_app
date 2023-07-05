import 'package:e_commerce_app/features/cart/view_model/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/component/custom_text.dart';
import '../../../core/constants/screens_names.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/style/colors.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Scaffold(
            body: cubit.cartProductModel.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: SvgPicture.asset(
                            'assets/images/empty_cart.svg',
                          ),
                        ),
                      ),
                      const CustomText(
                        title: 'Empty Cart',
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: kTextColor,
                      )
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Slidable(
                                  startActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) =>
                                              cubit.deleteProduct(
                                                  cubit.cartProductModel[index]
                                                      .productId,
                                                  index),
                                          backgroundColor: kPrimaryColor,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                        ),
                                      ]),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 120.h,
                                        width: isLandscape(context)
                                            ? 150.w
                                            : 120.w,
                                        child: Image.network(cubit
                                            .cartProductModel[index].image),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            title: cubit
                                                .cartProductModel[index].name,
                                            fontSize: 18.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          CustomText(
                                              title:
                                                  "\$${cubit.cartProductModel[index].price} ",
                                              fontSize: 12.sp,
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.normal),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Container(
                                            width: isLandscape(context)
                                                ? 120.w
                                                : 120.w,
                                            height: 40.h,
                                            color: Colors.grey.shade200,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      cubit.increaseQuantity(
                                                          index);
                                                    },
                                                    icon: const Icon(
                                                      Icons.add,
                                                      color: kTextColor,
                                                    )),
                                                CustomText(
                                                    title: cubit
                                                        .cartProductModel[index]
                                                        .quantity
                                                        .toString(),
                                                    fontSize: 12.sp,
                                                    color: kTextColor,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                IconButton(
                                                    onPressed: () {
                                                      cubit.decreaseQuantity(
                                                          index);
                                                    },
                                                    icon: const Icon(
                                                      Icons.minimize,
                                                      color: kTextColor,
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 7.h,
                                );
                              },
                              itemCount: cubit.cartProductModel.length),
                        ),
                      ),
                      Expanded(
                        flex: isLandscape(context) ? 3 : 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        title: 'total',
                                        fontSize: 18.sp,
                                        color: kTextColor,
                                        fontWeight: FontWeight.normal),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    BlocBuilder<CartCubit, CartStates>(
                                      builder: (context, state) {
                                        return CustomText(
                                            title:
                                                "\$${CartCubit.get(context).totalPrice} ",
                                            fontSize: 14.sp,
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold);
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, ScreensNames.checkOut);
                                  },
                                  child: Container(
                                    width: 130.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                          title: 'checkout',
                                          fontSize: 16.sp,
                                          color: kLightColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
      },
    );
  }
}
