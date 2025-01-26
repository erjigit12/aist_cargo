import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Подключить подписку '),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(
              child: Text(
                'Вы выбрали тариф: 1 месяц за 99₽',
                textAlign: TextAlign.center,
                style:
                    AppTextStyles.f16w600.copyWith(color: AppColors.textColor),
              ),
            ),
            20.h,
            const Text(
              'Имя',
              style: AppTextStyles.f14w500,
            ),
            3.h,
            const TextFormFieldWidget(
              backroundColor: AppColors.whiteColor,
            ),
            16.h,
            const Text(
              'Фамилия',
              style: AppTextStyles.f14w500,
            ),
            3.h,
            const TextFormFieldWidget(
              backroundColor: AppColors.whiteColor,
            ),
            16.h,
            const Text(
              'Номер карты',
              style: AppTextStyles.f14w500,
            ),
            3.h,
            const TextFormFieldWidget(
              backroundColor: AppColors.whiteColor,
            ),
            16.h,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Дата',
                              style: AppTextStyles.f14w500,
                            ),
                            Text(
                              'MM/DD/YYY',
                              style: AppTextStyles.f14w400
                                  .copyWith(color: AppColors.greyTextColor),
                            ),
                          ],
                        ),
                        3.h,
                        const TextFormFieldWidget(
                          backroundColor: AppColors.whiteColor,
                        ),
                      ]),
                ),
                16.w,
                Expanded(
                  flex: 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'CVV',
                          style: AppTextStyles.f14w500,
                        ),
                        3.h,
                        const TextFormFieldWidget(
                          backroundColor: AppColors.whiteColor,
                        ),
                      ]),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButtonWidget(
              title: 'Подключить',
              onPressed: () {},
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/protect.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
