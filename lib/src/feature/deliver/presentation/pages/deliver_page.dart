import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';

class DeliverPage extends StatefulWidget {
  const DeliverPage({super.key});

  @override
  State<DeliverPage> createState() => _DeliverPageState();
}

class _DeliverPageState extends State<DeliverPage> {
  int selectedIndex = -1;

  final List<DeliveryOption> deliveryOptions = [
    DeliveryOption(
        title: 'Самолет',
        iconPath: 'assets/images/airplane.png',
        color: AppColors.redBrighterColor),
    DeliveryOption(
        title: 'Поиск',
        iconPath: 'assets/images/search_in_cloud.png',
        color: AppColors.yellowBrighterColor),
    DeliveryOption(
        title: 'Автомобиль',
        iconPath: 'assets/images/car.png',
        color: AppColors.greenBrighterColor),
    DeliveryOption(
        title: 'Грузовик',
        iconPath: 'assets/images/semi_truck.png',
        color: AppColors.blueBrighterColor),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            100.h,
            const Image(image: AssetImage('assets/images/logo_aist_cargo.png')),
            16.h,
            const Image(image: AssetImage('assets/images/aistcargo.png')),
            50.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Разместите информацию о Ваших поездках, чтобы помочь другим людям с доставкой посылок ',
                style:
                    AppTextStyles.f10w400.copyWith(color: AppColors.textColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width,
              height: width,
              child: Stack(
                alignment: Alignment.center,
                children: List.generate(deliveryOptions.length, (index) {
                  final option = deliveryOptions[index];

                  return Positioned(
                    top: index == 0 ? width * 0.22 : null,
                    bottom: index == 1 ? width * 0.22 : null,
                    left: index == 2 ? width * 0.22 : null,
                    right: index == 3 ? width * 0.22 : null,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () => selectedIndex = index,
                        );
                        Navigator.pushNamed(
                          context,
                          AppRoutes.isSubscribed,
                          arguments: {
                            'appBar': option.title,
                            'deliverOrSend': true,
                          },
                        );
                      },
                      child: buildRotatedContainer(
                        size: width * 0.22,
                        color: selectedIndex == index
                            ? option.color
                            : option.color,
                        icon: option.iconPath,
                        label: option.title,
                        index: index,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRotatedContainer({
    required double size,
    required Color color,
    required String icon,
    required String label,
    required int index,
  }) {
    return Transform.rotate(
      angle: 0.80,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: selectedIndex == index
              ? [
                  BoxShadow(
                    color: Colors.green.withValues(alpha: 0.2),
                    blurRadius: 0,
                    spreadRadius: 7,
                    offset: const Offset(1, 1),
                  )
                ]
              : null,
        ),
        width: size,
        height: size,
        child: Transform.rotate(
          angle: -0.75,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon, width: size * 0.4),
                SizedBox(height: size * 0.1),
                Text(label, style: TextStyle(fontSize: size * 0.13)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
