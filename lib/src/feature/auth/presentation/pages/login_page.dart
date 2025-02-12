import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/images/logo_aist_cargo.png'),
              ),
            ),
            16.h,
            const Center(
              child: Image(
                image: AssetImage('assets/images/aistcargo.png'),
              ),
            ),
            16.h,
            const Text(
              'AistCargo - быстро и удобно передать посылку между доставщиком и отправителем',
              style: AppTextStyles.f14w400,
              textAlign: TextAlign.center,
            ),
            16.h,
            const Center(
              child: Text(
                'Вход',
                style: AppTextStyles.f20w400,
                textAlign: TextAlign.center,
              ),
            ),
            16.h,
            Row(
              children: [
                Expanded(
                  child: OutlineButtonWidget(
                    title: 'Google',
                    icon: 'assets/icons/google.png',
                    onPressed: () {},
                  ),
                ),
                8.w,
                Expanded(
                  child: OutlineButtonWidget(
                    title: 'Apple',
                    icon: 'assets/icons/apple.png',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            16.h,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.8,
                    color: AppColors.greyBrightColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Или войти с помощью'),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.8,
                    color: AppColors.greyBrightColor,
                  ),
                ),
              ],
            ),
            32.h,

            // TEXT FIELDS
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFieldWithTitle(
                  title: 'Электронная почта',
                  backgroundColor: Colors.transparent,
                  hintText: 'Электронная почта',
                ),
                16.h,
                const TextFieldWithTitle(
                  title: 'Пароль',
                  backgroundColor: Colors.transparent,
                  hintText: 'Пароль',
                  suffix: true,
                ),
                8.h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/forgotPassword'),
                      child: Text(
                        'Забыли пароль?',
                        style: AppTextStyles.f14w500.copyWith(
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
                16.h,
                ElevatedButtonWidget(
                  title: 'Продолжить',
                  onPressed: () => Navigator.pushNamed(context, '/otpCode',
                      arguments: 'pesfifaer20@gmail.com'),
                ),
                8.h,
                const UserAgreement(),
                26.h,
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: Text(
                      'Регистрация',
                      style: AppTextStyles.f14w500.copyWith(
                        color: AppColors.blueColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blueColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
