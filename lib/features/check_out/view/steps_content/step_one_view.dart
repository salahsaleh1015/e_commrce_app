
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/custom_text.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/style/colors.dart';

class StepOneView extends StatefulWidget {
  StepOneView({Key? key}) : super(key: key);

  @override
  State<StepOneView> createState() => _StepOneViewState();
}

class _StepOneViewState extends State<StepOneView> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: 'Standard Delivery',
          fontWeight: FontWeight.bold,
          fontSize: isLandscape(context) ? 20.sp : 15.sp,
          color: kTextColor,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: CustomText(
                  color: kTextColor,
              fontWeight: FontWeight.normal,
                  fontSize: isLandscape(context) ? 20.sp : 15.sp,
              title:   'Order will be delivered between 3 - 5 business days',

            )),
            Radio(
                activeColor: kPrimaryColor,
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                })
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomText(
          title:  'Next Day Delivery',
          fontWeight: FontWeight.bold,
          fontSize: isLandscape(context) ? 20.sp : 15.sp,
          color: kTextColor,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: CustomText(
                  title:  'Place your order before 6pm and your items will be delivered the next day',
              fontWeight: FontWeight.normal,
                  fontSize: isLandscape(context) ? 20.sp : 15.sp,
                  color: kTextColor,
            )),
            Radio(
                activeColor: kPrimaryColor,
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                })
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomText(
          title: 'Nominated Delivery',
          fontWeight: FontWeight.bold,
          fontSize: isLandscape(context) ? 20.sp : 15.sp,
          color: kTextColor,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: CustomText(
                  color: kTextColor,
                  fontSize: isLandscape(context) ? 20.sp : 15.sp,
              fontWeight:FontWeight.normal ,

              title:
              'Pick a particular date from the calendar and order will be delivered on selected date',
             
            )),
            Radio(
                activeColor: kPrimaryColor,
                value: 3,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                })
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
