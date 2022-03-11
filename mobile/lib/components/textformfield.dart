import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String input;
  final bool isPassword;
  final int? maxLines;
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.input, required this.isPassword, this.maxLines,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines != null ? maxLines : 1,
      controller: controller,
      decoration: InputDecoration(
        hintText: input,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your " + input.toLowerCase();
        }
        return null;
      },
      obscureText: isPassword && maxLines == 1,
    );
  }
}
