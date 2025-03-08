import 'package:app_note/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.controller,
  });
  final String? hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (val) {
        if (val?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor)),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white));
}
