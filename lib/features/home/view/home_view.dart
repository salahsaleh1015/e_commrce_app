
import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/features/details/view/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/component/custom_text.dart';
import '../../../core/constants/screens_names.dart';
import '../view_model/home_cubit.dart';


class HomeView extends StatelessWidget {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> images = [
    "assets/images/Icon_Mens Shoe.png",
    "assets/images/Group 217.png",
    "assets/images/Icon_Devices.png",
    "assets/images/Icon_Gadgets.png",
    "assets/images/Icon_Gaming.png",
  ];
  List<String> titles = [
   'men','women','device','gedgets','gaming'
  ];
  @override
  Widget build(BuildContext context) {
    var cubit  = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit  = HomeCubit.get(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchFormField(context),
              SizedBox(
                height: 30.h,
              ),
              CustomText(
                title: 'Categories',
                color: kTextColor,
                fontSize: 20.sp,
                fontWeight:FontWeight.bold ,
              ),

              SizedBox(
                height: 10.h,
              ),
              _categoryList(),
              SizedBox(
                height: 20.h,
              ),
              CustomText(title:'Best Selling ', fontSize: 18.sp, color: kTextColor, fontWeight: FontWeight.bold),

              SizedBox(
                height: 20.h,
              ),
              _productList(context),
            ],
          ),
        ),
      ),
    );
  },
);
  }

  Widget _searchFormField(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.black),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _categoryList() => BlocConsumer<HomeCubit, HomeStates>(
  listener: (context, state) {

  },
  builder: (context, state) {
    var cubit  = HomeCubit.get(context);
    return SizedBox(
        height: 80.h,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color:  Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Image.network(cubit.categoryModel[index].image),
                  ),
                  CustomText(title:  cubit.categoryModel[index].name, fontSize: 12, color: kSecondaryColor, fontWeight: FontWeight.normal)

                ],
              );

            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 7.w,
              );
            },
            itemCount: cubit.categoryModel.length),
      );
  },
);

  Widget _productList(context) => BlocConsumer<HomeCubit, HomeStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit  = HomeCubit.get(context);
    return SizedBox(
        height: 350.h,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                 // Navigator.pushNamed(context, ScreensNames.details);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsView(model:cubit.productModel[i] )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(cubit.productModel[i].image),
                    CustomText(title:cubit.productModel[i].name, fontSize: 16.sp, color: kTextColor, fontWeight: FontWeight.bold),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomText(title:  cubit.productModel[i].price, fontSize: 12.sp, color: kPrimaryColor, fontWeight: FontWeight.normal)

                  ],
                ),
              );
            },
            separatorBuilder: (context, i) {
              return SizedBox(
                width: 10.w,
              );
            },
            itemCount: cubit.productModel.length),
      );
  },
);
}
