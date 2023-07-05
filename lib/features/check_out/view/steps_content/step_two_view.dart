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
  @override
  Widget build(BuildContext context) {
    return Column(
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
        CustomText(title: 'street 1', fontSize: 12.sp, color: kSecondaryColor, fontWeight:FontWeight.normal),

        CustomFormField(title: "title", onSaved: (val) {}, validator: (val) {}),
        SizedBox(
          height: 30.h,
        ),
        CustomText(title:  'street2', fontSize: 12.sp, color: kSecondaryColor, fontWeight:FontWeight.normal),
        CustomFormField(title: "title", onSaved: (val) {}, validator: (val) {}),
        SizedBox(
          height: 30.h,
        ),
        CustomText(title: 'city', fontSize: 12.sp, color: kSecondaryColor, fontWeight:FontWeight.normal),
        CustomFormField(title: "title", onSaved: (val) {}, validator: (val) {}),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
