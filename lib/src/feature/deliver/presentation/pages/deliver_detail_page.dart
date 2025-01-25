import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';

class DeliverDetailPage extends StatelessWidget {
  const DeliverDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Откуда, куда и когда вы едете?',
                style: AppTextStyles.f12w600),
            16.h,
            const TextFieldWidget(hintText: 'Москва'),
            16.h,
            const TextFieldWidget(
              hintText: 'Ош',
            ),
            16.h,
            Row(
              children: [
                const Expanded(child: TextFieldWidget(hintText: '24.01.2025')),
                8.w,
                const Expanded(
                  child: TextFieldWidget(hintText: '28.01.2025'),
                ),
              ],
            ),
            32.h,
            const Text(
              'Какие посылки вы готовы доставить?',
              style: AppTextStyles.f12w600,
            ),
            16.h,
          ],
        ),
      ),
    );
  }
}
