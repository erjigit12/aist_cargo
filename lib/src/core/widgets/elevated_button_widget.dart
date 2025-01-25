import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    this.onPressed,
    required this.title,
  });

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
              fixedSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: AppTextStyles.f18w400,
            ),
            child: Text(title),
          ),
        ),
      ],
    );
  }
}
