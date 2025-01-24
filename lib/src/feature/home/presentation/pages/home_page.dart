import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/logo_aist_cargo.png'),
          ),
          16.h,
          const Image(
            image: AssetImage('assets/images/aistcargo.png'),
          ),
          50.h,
          const Text(
            'У Вас отправка или поездка?',
            style: AppTextStyles.f12w600,
          ),
          16.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/send.png'),
                  ),
                  16.h,
                  const Text('Отправить', style: AppTextStyles.f12w500),
                ],
              ),
              16.w,
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/deliver.png'),
                  ),
                  16.h,
                  const Text('Отправить', style: AppTextStyles.f12w500),
                ],
              ),
            ],
          ),
          50.h,
          const Text('Что такое AISTCARGO?', style: AppTextStyles.f14w400),
          16.h,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'AistCargo - быстро и удобно передать посылку между доставщиком и отправителем ?',
              style: AppTextStyles.f12w400,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
