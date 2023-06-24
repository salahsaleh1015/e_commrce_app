import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/component/custom_button.dart';
import '../../../core/component/custom_social_button.dart';
import '../../../core/component/custom_text.dart';
import '../../../core/component/custom_text_form_feild.dart';
import '../../../core/constants/screens_names.dart';
import '../../../core/style/colors.dart';
import '../view_model/auth_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: "Welcome,",
                            color: kTextColor,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             const RegisterView()));
                              Navigator.pushNamed(
                                  context, ScreensNames.register);
                            },
                            child: CustomText(
                              title: 'Sign Up',
                              color: kPrimaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                          title: "Sign in to Continue",
                          color: kSecondaryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: 80.h,
                      ),
                      CustomText(
                        title: "email",
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
                            return "must not be empty";
                          }
                        },
                        title: "...",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        title: "password",
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
                            return "must not be empty";
                          }
                        },
                        title: "**********",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: CustomButton(
                          title: "SIGN IN",
                          onTap: () {
                            _formKey.currentState!.save();
                            if(_formKey.currentState!.validate()){
                             AuthCubit.get(context).signInWithEmailAndPassword(context);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Text(
                          "-OR-",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: CustomSocialButton(
                          onTap: () {
                            AuthCubit.get(context).signInWithGoogleMethod(context);
                          },
                          text: 'Sign In with Google',
                          image: "assets/images/icons8_Google_2.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
