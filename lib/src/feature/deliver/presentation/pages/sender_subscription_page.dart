import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';

class SenderSubscriptionPage extends StatefulWidget {
  const SenderSubscriptionPage({super.key});

  @override
  State<SenderSubscriptionPage> createState() => _SenderSubscriptionPageState();
}

class _SenderSubscriptionPageState extends State<SenderSubscriptionPage> {
  int selectedSubscriptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Подключить Подписку',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/images/sender.png'),
            16.h,
            const Text(
              'Вы выбрали тариф: 1 месяц за 99₽',
              style: AppTextStyles.f16w500,
              textAlign: TextAlign.center,
            ),
            16.h,
            const Text(
              ' Чем больше срок, тем больше выгода',
              style: AppTextStyles.f12w400,
              textAlign: TextAlign.center,
            ),
            8.h,
            SubscriptionButton(
              text: 'Подключить за 999Р на 3 месяцев',
              color: AppColors.subscribeBlueColor,
              index: 1,
              currentIndex: selectedSubscriptionIndex,
              onSelect: (index) {
                setState(() {
                  selectedSubscriptionIndex = index;
                });
              },
            ),
            12.h,
            SubscriptionButton(
              text: 'Подключить за 1499Р на 6 месяцев',
              color: AppColors.subscribeRedColor,
              index: 2,
              currentIndex: selectedSubscriptionIndex,
              onSelect: (index) {
                setState(() {
                  selectedSubscriptionIndex = index;
                });
              },
            ),
            12.h,
            SubscriptionButton(
              text: 'Подключить за 1999Р на 12 месяцев',
              color: AppColors.subscribeYellowColor,
              index: 3,
              currentIndex: selectedSubscriptionIndex,
              onSelect: (index) {
                setState(() {
                  selectedSubscriptionIndex = index;
                });
              },
            ),
            8.h,
            const Spacer(),
            ElevatedButtonWidget(title: 'Далее', onPressed: () {}),
            30.h,
          ],
        ),
      ),
    );
  }
}
