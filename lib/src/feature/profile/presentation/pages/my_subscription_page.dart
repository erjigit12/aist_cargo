import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class MySubscriptionPage extends StatelessWidget {
  const MySubscriptionPage({
    super.key,
    required this.appBarTitle,
  });

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appBarTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/dollars.png'),
          const Text('1 месяц за 99₽', style: AppTextStyles.f16w600),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Дата начала', style: AppTextStyles.f14w500),
                Text('10.01.2025', style: AppTextStyles.f16w600),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Дата окончания', style: AppTextStyles.f14w500),
                Text('10.02.2025', style: AppTextStyles.f16w600),
              ],
            ),
          ),
          // ElevatedButtonWidget(title: 'Обновить  подписку', onPressed: () {}),
        ],
      ),
    );
  }
}
