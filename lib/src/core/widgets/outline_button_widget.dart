import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({
    super.key,
    this.onPressed,
    this.icon,
    required this.title,
    this.titleColor,
  });

  final void Function()? onPressed;
  final String? icon;
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(double.infinity, 60),
        side: const BorderSide(color: Colors.black26, width: 0.6),
        animationDuration: const Duration(milliseconds: 500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('$icon'),
          16.w,
          Text(
            title,
            style: AppTextStyles.f16w400.copyWith(
              color: titleColor ?? AppColors.greyTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
