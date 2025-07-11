import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    super.key,
    required this.title,
    this.hintText,
    this.backgroundColor,
    this.suffix,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.isRead,
    this.errorText,
  });

  final String title;
  final String? hintText;
  final Color? backgroundColor;
  final bool? suffix;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? isRead;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.f15w400),
        8.h,
        TextFormFieldWidget(
          errorText: errorText,
          isRead: isRead,
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          validator: validator,
          hintText: hintText,
          backroundColor: backgroundColor ?? AppColors.whiteColor,
          suffix: suffix,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
