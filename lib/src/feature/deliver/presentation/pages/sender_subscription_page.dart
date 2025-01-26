import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class SenderSubscriptionPage extends StatelessWidget {
  const SenderSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Подключить Подписку',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
        ],
      ),
    );
  }
}
