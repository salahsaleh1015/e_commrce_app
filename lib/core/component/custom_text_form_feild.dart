import 'package:flutter/material.dart';

import '../style/colors.dart';

class CustomFormField extends StatelessWidget {

  final String title;
  final ValueChanged onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;

  const CustomFormField({super.key,  required this.title, required this.onSaved, required this.validator,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      decoration:  InputDecoration(
          focusedBorder:   const OutlineInputBorder(

              borderSide: BorderSide(

                  color: kPrimaryColor
              )
          ),
          hintText: title,
          hintStyle: const TextStyle(
              color: Colors.black
          )
      ),
    );
  }
}