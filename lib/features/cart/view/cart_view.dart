
import 'package:e_commerce_app/features/cart/view_model/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        body: Column(
      children: [
        Expanded(
          flex: 6,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 120.h,
                        width: isLandscape(context)?150.w:120.w,
                        child: Image.network(cubit.cartProductModel[index].image),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title:cubit.cartProductModel[index].name,
                            fontSize: 18.sp,
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                          ),

                           SizedBox(
                            height: 7.h,
                          ),
                          CustomText(title: "\$${cubit.cartProductModel[index].price} ", fontSize: 12.sp, color: kPrimaryColor, fontWeight: FontWeight.normal),

                           SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width:isLandscape(context)?65.w: 105.w,
                            height: 40.h,
                            color: Colors.grey.shade200,
                            child: Row(
                              children: [
                                IconButton(onPressed: (){}, icon:  const Icon(Icons.add,
                                color: kTextColor,

                                )),
                                CustomText(title: cubit.cartProductModel[index].quantity.toString(), fontSize: 12.sp, color: kTextColor, fontWeight: FontWeight.normal),
                                IconButton(onPressed: (){}, icon:  const Icon(Icons.minimize,color:  kTextColor,)

                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return  SizedBox(
                    height: 7.h,
                  );
                },
                itemCount: cubit.cartProductModel.length),
          ),
        ),
        Expanded(
          flex:isLandscape(context)?3: 1,
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(title: 'total', fontSize: 18.sp, color: kTextColor, fontWeight: FontWeight.normal),

                       SizedBox(
                        height: 7.h,
                      ),
                      CustomText(title: "\$1100 ", fontSize: 14.sp, color: kPrimaryColor, fontWeight: FontWeight.bold),
                       SizedBox(
                        height: 10.h,
                      ),

                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                     // Navigator.pushNamed(context, ScreensNames.checkOut);
                    },
                    child: Container(
                      width: 130.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child:   CustomText(title: 'checkout', fontSize: 16.sp, color: kLightColor, fontWeight: FontWeight.bold),),
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
