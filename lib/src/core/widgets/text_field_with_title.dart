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
  });

  final String title;
  final String? hintText;
  final Color? backgroundColor;
  final bool? suffix;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.f15w400),
        8.h,
        TextFormFieldWidget(
          hintText: hintText,
          backroundColor: backgroundColor ?? AppColors.whiteColor,
          suffix: suffix,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
