import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class SubscriptionButton extends StatelessWidget {
  const SubscriptionButton({
    super.key,
    required this.text,
    required this.color,
    required this.index,
    required this.currentIndex,
    required this.onSelect,
  });

  final String text;
  final Color color;
  final int index;
  final int currentIndex;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: () => onSelect(index),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                offset: Offset(0, 3),
              )
            ],
            color: color,
            border: Border.all(
              color: currentIndex == index
                  ? AppColors.greenColor
                  : Colors.transparent,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.f12w400.copyWith(color: AppColors.textColor),
          ),
        ),
      ),
    );
  }
}
