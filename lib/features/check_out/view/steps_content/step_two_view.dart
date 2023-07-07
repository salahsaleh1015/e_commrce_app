import '../../../../core/component/custom_text.dart';
import '../../../../core/component/custom_text_form_feild.dart';
import '../../../../core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepTwoView extends StatefulWidget {
  StepTwoView({Key? key}) : super(key: key);

  @override
  State<StepTwoView> createState() => _StepTwoViewState();
}

class _StepTwoViewState extends State<StepTwoView> {

  static var formKey = GlobalKey<FormState>();
  late String streetOne,streetTwo,city;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/images/Checkbox.png"),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: CustomText(
                  title: 'Billing address is the same as delivery address',
                  fontWeight: FontWeight.normal,
                  fontSize: 16.sp,
                  color: kTextColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomText(
              title: 'street 1',
              fontSize: 12.sp,
              color: kSecondaryColor,
              fontWeight: FontWeight.normal),
          CustomFormField(
              title: "title",
              onSaved: (val) {
                streetOne = val;
              },
              validator: (String? val) {
                if (val == null) {
                  return " it must not be empty ";
                }
              }),
          SizedBox(
            height: 30.h,
          ),
          CustomText(
              title: 'street2',
              fontSize: 12.sp,
              color: kSecondaryColor,
              fontWeight: FontWeight.normal),
          CustomFormField(
              title: "title",
              onSaved: (val) {
                streetTwo = val;
              },
              validator: (val) {
                if (val == null) {
                  return " it must not be empty ";
                }
              }),
          SizedBox(
            height: 30.h,
          ),
          CustomText(
              title: 'city',
              fontSize: 12.sp,
              color: kSecondaryColor,
              fontWeight: FontWeight.normal),
          CustomFormField(
              title: "title",
              onSaved: (val) {
                city = val;
              },
              validator: (val) {
                if (val == null) {
                  return " it must not be empty ";
                }
              }),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
