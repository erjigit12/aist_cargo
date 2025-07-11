import 'package:aist_cargo/src/core/constants/colors.dart';
import 'package:aist_cargo/src/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.onTap,
    this.readOnly,
    this.onChanged,
    this.errorText,
  });

  final String hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: prefixIcon ?? const Icon(Icons.location_on),
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
