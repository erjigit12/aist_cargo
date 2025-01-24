import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class DeliverPage extends StatefulWidget {
  const DeliverPage({super.key});

  @override
  State<DeliverPage> createState() => _DeliverPageState();
}

class _DeliverPageState extends State<DeliverPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Разместите информацию о Ваших поездках, чтобы помочь другим людям с доставкой посылок ',
              style: AppTextStyles.f10w400.copyWith(
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Ромб из контейнеров
          SizedBox(
            width: width,
            height: width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Верхний контейнер (Самолетом)
                Positioned(
                  top: width * 0.23,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AirplanePage()),
                      // );
                    },
                    child: buildRotatedContainer(
                      size: width * 0.22,
                      color: selectedIndex == 0
                          ? const Color(0xff80CC28).withOpacity(0.7)
                          : const Color(0xffF1511B).withOpacity(0.3),
                      icon: 'assets/images/airplane.png',
                      label: 'Самолетом',
                    ),
                  ),
                ),
                // Нижний контейнер (Поиск)
                Positioned(
                  bottom: width * 0.23,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SearchPage()),
                      // );
                    },
                    child: buildRotatedContainer(
                      size: width * 0.22,
                      color: selectedIndex == 1
                          ? const Color(0xff80CC28).withOpacity(0.7)
                          : const Color(0xffFFB900).withOpacity(0.3),
                      icon: 'assets/images/search_in_cloud.png',
                      label: 'Поиск',
                    ),
                  ),
                ),
                // Левый контейнер (Автомобилем)
                Positioned(
                  left: width * 0.23,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => CarPage()),
                      // );
                    },
                    child: buildRotatedContainer(
                      size: width * 0.22,
                      color: selectedIndex == 2
                          ? const Color(0xff80CC28).withOpacity(0.7)
                          : const Color(0xff80CC28).withOpacity(0.3),
                      icon: 'assets/images/car.png',
                      label: 'Автомобилем',
                    ),
                  ),
                ),
                // Правый контейнер (Грузовиком)
                Positioned(
                  right: width * 0.23,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => TruckPage()),
                      // );
                    },
                    child: buildRotatedContainer(
                      size: width * 0.22,
                      color: selectedIndex == 3
                          ? const Color(0xff80CC28).withOpacity(0.7)
                          : const Color(0xff00ADEF).withOpacity(0.3),
                      icon: 'assets/images/semi_truck.png',
                      label: 'Грузовиком',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Общий метод для создания контейнеров в ромбе
  Widget buildRotatedContainer({
    required double size,
    required Color color,
    required String icon,
    required String label,
  }) {
    return Transform.rotate(
      angle: 0.78, // Поворот на 45 градусов
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
                Image.asset(
                  icon,
                  width: size * 0.4,
                ),
                SizedBox(height: size * 0.1),
                Text(
                  label,
                  style: TextStyle(fontSize: size * 0.13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
