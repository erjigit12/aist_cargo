import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Text(
            'У Вас отправка или поездка?',
            style: AppTextStyles.f12w600.copyWith(color: AppColors.textColor),
          ),
          16.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().selectIndex(1);
                  context.read<MainCubit>().change(3);
                },
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/send.png'),
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<HomeCubit, int>(
                      builder: (context, selectedIndex) {
                        return Column(
                          children: [
                            Text(
                              'Отправить',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: selectedIndex == 1
                                    ? Colors.yellow
                                    : AppColors.textColor,
                              ),
                            ),
                            if (selectedIndex == 1)
                              Container(
                                width: 50,
                                height: 2,
                                color: Colors.yellow,
                                margin: const EdgeInsets.only(top: 4),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().selectIndex(2);
                  context.read<MainCubit>().change(1);
                },
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/deliver.png'),
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<HomeCubit, int>(
                      builder: (context, selectedIndex) {
                        return Column(
                          children: [
                            Text(
                              'Доставить',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: selectedIndex == 2
                                    ? Colors.yellow
                                    : AppColors.textColor,
                              ),
                            ),
                            if (selectedIndex == 2)
                              Container(
                                width: 50,
                                height: 2,
                                color: Colors.yellow,
                                margin: const EdgeInsets.only(top: 4),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          50.h,
          Text(
            'Что такое AISTCARGO?',
            style: AppTextStyles.f12w600.copyWith(
              color: AppColors.textColor,
            ),
          ),
          16.h,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'AistCargo - быстро и удобно передать посылку между доставщиком и отправителем.',
              style: AppTextStyles.f12w400,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
