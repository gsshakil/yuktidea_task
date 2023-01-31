import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuktidea_task/core/constants/colors.dart';

class KPasswordTextField extends StatefulWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final String? hintText;
  final TextInputAction? inputAction;

  const KPasswordTextField(
      {Key? key,
      required this.controller,
      this.prefixIcon,
      this.validator,
      this.keyboardType = TextInputType.name,
      this.onTap,
      this.suffixIcon,
      this.numberFormatters = false,
      this.hintText,
      this.inputAction,
      this.readOnly = false})
      : super(key: key);
  final bool numberFormatters;

  @override
  State<KPasswordTextField> createState() => _KPasswordTextFieldState();
}

class _KPasswordTextFieldState extends State<KPasswordTextField> {
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: kBlackColor, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(fontSize: 16),
        validator: widget.validator,
        cursorColor: kWhiteColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          border: InputBorder.none,
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: kWhiteColor.withOpacity(0.5),
              size: 18,
            ),
          ),
        ),
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        obscureText: _isHidden,
        textInputAction: widget.inputAction,
        keyboardType: widget.keyboardType,
        inputFormatters: [
          if (widget.numberFormatters)
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ],
      ),
    );
  }
}
