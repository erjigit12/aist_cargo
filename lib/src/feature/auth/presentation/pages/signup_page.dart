import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
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
                  'Регистрация',
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
                  const Text('Имя', style: AppTextStyles.f14w500),
                  8.h,
                  const TextFormFieldWidget(hintText: 'Ivan'),
                  16.h,
                  const Text('Фамилия', style: AppTextStyles.f14w500),
                  8.h,
                  const TextFormFieldWidget(hintText: 'Ivanov'),
                  16.h,
                  const Text('e-mail', style: AppTextStyles.f14w500),
                  8.h,
                  const TextFormFieldWidget(hintText: 'Ivan@gmail.com'),
                  16.h,
                  const Text('Пароль', style: AppTextStyles.f14w500),
                  8.h,
                  const TextFormFieldWidget(
                    suffix: true,
                    hintText: '******',
                  ),
                  16.h,
                  const Text(
                    'Подтвердите пароль',
                    style: AppTextStyles.f14w500,
                  ),
                  8.h,
                  const TextFormFieldWidget(
                    suffix: true,
                    hintText: '******',
                  ),
                  26.h,
                  const ElevatedButtonWidget(),
                  8.h,
                  const UserAgreement(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
