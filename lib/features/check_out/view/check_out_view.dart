
import 'package:e_commerce_app/features/check_out/view/steps_content/step_one_view.dart';
import 'package:e_commerce_app/features/check_out/view/steps_content/step_three_view.dart';
import 'package:e_commerce_app/features/check_out/view/steps_content/step_two_view.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Checkout", ),
        ),
        body:isCompleted?const CompleteView():Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              colorScheme:   const ColorScheme.light(
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
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              final isLastStep = currentStep == getSteps().length - 1;
              return Row(
                children: [
                  Expanded(
                    child:
                        ElevatedButton(onPressed:controls.onStepContinue, child:
                        Text(isLastStep? "confirm": "next")),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                if(currentStep!=0) Expanded(
                      child: ElevatedButton(
                          onPressed: controls.onStepCancel, child: const Text("back"))),
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
            title:  Text("Delivery",style: Theme.of(context).textTheme.caption),
            content:StepOneView()),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title:  Text("Address",style: Theme.of(context).textTheme.caption),
            content: StepTwoView()),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title:  Text("Summer",style: Theme.of(context).textTheme.caption),
            content: StepThreeView()),
      ];
}
