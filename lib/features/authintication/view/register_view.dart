import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/component/custom_button.dart';
import '../../../core/component/custom_text.dart';
import '../../../core/component/custom_text_form_feild.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/style/colors.dart';
import '../view_model/auth_cubit.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                color: Colors.black,
                iconSize: 30.r,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
            body:
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child:Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                        title: 'Sign Up',
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                        color: kTextColor,
                      ),

                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        title:'name',
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        color: kTextColor,
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        onSaved: (val) {
                          AuthCubit.get(context).name = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'invalid email';
                          }
                        },
                        title: "...",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        title:"email",
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        color: kTextColor,
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        onSaved: (val) {
                          AuthCubit.get(context).email = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'invalid email';
                          }
                        },
                        title: "...",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        title: 'password',
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        color: kTextColor,
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      CustomFormField(
                        onSaved: (val) {
                          AuthCubit.get(context).password = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'invalid email';
                          }
                        },
                        title: "**********",
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Center(
                        child: CustomButton(
                          title: 'SIGN UP',
                          onTap: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              AuthCubit.get(context)
                                  .registerWithEmailAndPassword(context);
                            }
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )


          ),
        );
      },
    );
  }

}