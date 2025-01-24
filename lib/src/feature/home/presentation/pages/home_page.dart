import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

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
                  setState(() {
                    selectedIndex = 1;
                  });
                  // Навигация на другую страницу
                },
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/send.png'),
                    ),
                    const SizedBox(height: 16),
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
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  // Навигация на другую страницу
                },
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/deliver.png'),
                    ),
                    const SizedBox(height: 16),
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
