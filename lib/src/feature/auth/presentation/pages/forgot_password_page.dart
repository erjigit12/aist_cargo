import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            const Text('Забыли пароль?', style: AppTextStyles.f24w600),
            8.h,
            Text(
              'Введите свой адрес электронной почты',
              style: AppTextStyles.f14w500
                  .copyWith(color: AppColors.greyTextColor),
            ),
            const Spacer(flex: 1),
            const TextFieldWithTitle(
              title: 'Электронный адрес',
              backgroundColor: Colors.transparent,
              hintText: 'Введите адрес электронной почты',
            ),
            const Spacer(flex: 4),
            ElevatedButtonWidget(title: 'Продолжить', onPressed: () {}),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
