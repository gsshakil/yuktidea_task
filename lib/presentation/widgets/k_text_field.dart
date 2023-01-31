import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuktidea_task/core/constants/colors.dart';

class KTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final String? hintText;
  final TextInputAction? inputAction;

  const KTextField(
      {Key? key,
      required this.controller,
      this.prefixIcon,
      this.validator,
      this.keyboardType = TextInputType.name,
      this.onTap,
      this.suffixIcon,
      this.numberFormatters = false,
      this.obscureText = false,
      this.hintText,
      this.inputAction,
      this.readOnly = false})
      : super(key: key);
  final bool obscureText, numberFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: kBlackColor, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 16),
        validator: validator,
        cursorColor: kWhiteColor,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
        readOnly: readOnly,
        onTap: onTap,
        obscureText: obscureText,
        textInputAction: inputAction,
        keyboardType: keyboardType,
        inputFormatters: [
          if (numberFormatters)
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ],
      ),
    );
  }
}
