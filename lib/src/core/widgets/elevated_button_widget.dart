import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    // GlobalKey<FormState>? formKey,
    this.onPressed,
    required this.title,
    this.style,
    this.backgroundColor,
    this.side,
  });

  final void Function()? onPressed;
  final String title;
  final TextStyle? style;
  final Color? backgroundColor;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? AppColors.buttonColor,
                fixedSize: style == null
                    ? const Size(double.infinity, 60)
                    : const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: side,
                textStyle: AppTextStyles.f18w400),
            child: Text(
              title,
              style: style ??
                  AppTextStyles.f20w400.copyWith(
                    color: const Color(0xFF101010),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
