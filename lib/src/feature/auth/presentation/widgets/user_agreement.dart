import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class UserAgreement extends StatelessWidget {
  const UserAgreement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        style: AppTextStyles.f9w400,
        TextSpan(
          text: 'Нажимая “Продолжить” Вы принимаете ',
          children: [
            TextSpan(
              text: 'Пользовательское соглашение',
              style: AppTextStyles.f9w400.copyWith(
                color: AppColors.blueColor,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
