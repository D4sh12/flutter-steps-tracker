import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.isObscureText = false,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.onSave,
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  final bool? isObscureText;
  final String? labelText;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final Function(String?)? onSave;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText!,
      keyboardType: keyboardType,
      onSaved: onSave,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
            RegExp(r'[a-z]| ', caseSensitive: false)),
      ],
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}
