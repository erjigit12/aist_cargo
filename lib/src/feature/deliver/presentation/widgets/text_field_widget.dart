import 'package:aist_cargo/src/core/constants/colors.dart';
import 'package:aist_cargo/src/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
  });

  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: suffixIcon ?? const Icon(Icons.location_on),
        hintText: hintText,
        hintStyle:
            AppTextStyles.f12w400.copyWith(color: AppColors.greyBrightColor),
        enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
