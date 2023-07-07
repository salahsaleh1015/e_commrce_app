import 'package:e_commerce_app/core/component/custom_text.dart';
import 'package:e_commerce_app/features/check_out/view/steps_content/step_one_view.dart';
import 'package:e_commerce_app/features/check_out/view/steps_content/step_three_view.dart';
import 'package:e_commerce_app/features/check_out/view/steps_content/step_two_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/component/custom_text_form_feild.dart';
import '../../../core/style/colors.dart';
import 'complete_view.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int currentStep = 0;
  bool isCompleted = false;
  late String streetOne,streetTwo,city;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Checkout",
          ),
        ),
        body: isCompleted
            ? const CompleteView()
            : Theme(
                data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                    colorScheme: const ColorScheme.light(
                      primary: kPrimaryColor,
                    )),
                child: Stepper(
                  elevation: 0.0,
                  type: StepperType.horizontal,
                 steps: getSteps(),

                  currentStep: currentStep,
                  onStepTapped: (step) {
                    setState(() {
                      currentStep = step;
                    });
                  },


                  onStepContinue: () {
                    if (currentStep == 1) {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {

                      }else{
                        setState(() {
                          currentStep -= 1;
                        });
                      }

                    }
                    final isLastStep = currentStep == getSteps().length - 1;
                    if (isLastStep) {
                      setState(() {
                        isCompleted = true;
                      });
                      print("complete");
                    } else {
                      setState(() {
                        currentStep += 1;
                      });
                    }
                  },
                  onStepCancel: () {
                    currentStep == 0
                        ? null
                        : setState(() {
                            currentStep -= 1;
                          });
                  },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controls) {
                    final isLastStep = currentStep == getSteps().length - 1;
                    return Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(

                              onPressed:controls.onStepContinue,
                              child: Text(isLastStep ? "confirm" : "next")),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        if (currentStep != 0)
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: controls.onStepCancel,
                                  child: const Text("back"))),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text("Delivery", style: Theme.of(context).textTheme.caption),
          content: StepOneView(),
        ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text("Address", style: Theme.of(context).textTheme.caption),
            content: Form(
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
                        if (val!.isEmpty) {
                          return " it must not be empty ";
                        }
                        return null;
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
                        if (val!.isEmpty) {
                          return " it must not be empty ";
                        }
                        return null;
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
                        if (val!.isEmpty) {
                          return " it must not be empty ";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            )),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: Text("Summer", style: Theme.of(context).textTheme.caption),
            content: StepThreeView()),
      ];
}
