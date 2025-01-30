import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/deliver/presentation/pages/create_delivery_page.dart';

// Модель для типа доставки
class DeliveryOption {
  final String title;
  final String iconPath;
  final Color color;

  DeliveryOption(
      {required this.title, required this.iconPath, required this.color});
}

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
        color: const Color(0xffF1511B)),
    DeliveryOption(
        title: 'Поиск',
        iconPath: 'assets/images/search_in_cloud.png',
        color: const Color(0xffFFB900)),
    DeliveryOption(
        title: 'Автомобиль',
        iconPath: 'assets/images/car.png',
        color: const Color(0xff80CC28)),
    DeliveryOption(
        title: 'Грузовик',
        iconPath: 'assets/images/semi_truck.png',
        color: const Color(0xff00ADEF)),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/logo_aist_cargo.png')),
          16.h,
          const Image(image: AssetImage('assets/images/aistcargo.png')),
          50.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Разместите информацию о Ваших поездках, чтобы помочь другим людям с доставкой посылок ',
              style: AppTextStyles.f10w400.copyWith(color: AppColors.textColor),
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
                  top: index == 0 ? width * 0.23 : null,
                  bottom: index == 1 ? width * 0.23 : null,
                  left: index == 2 ? width * 0.23 : null,
                  right: index == 3 ? width * 0.23 : null,
                  child: GestureDetector(
                    onTap: () {
                      setState(() => selectedIndex = index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CreateDeliveryPage(appBar: option.title),
                        ),
                      );
                    },
                    child: buildRotatedContainer(
                      size: width * 0.22,
                      color: selectedIndex == index
                          ? option.color.withOpacity(0.7)
                          : option.color.withOpacity(0.3),
                      icon: option.iconPath,
                      label: option.title,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRotatedContainer({
    required double size,
    required Color color,
    required String icon,
    required String label,
  }) {
    return Transform.rotate(
      angle: 0.78,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
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
