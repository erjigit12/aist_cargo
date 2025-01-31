import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreen([
      HomePage(),
      DeliverPage(),
      SizedBox(),
      Center(child: Text('4')),
      Center(child: Text('5')),
    ]);
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen(this.items, {super.key});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[context.watch<MainCubit>().state],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : AppColors.buttonColor,
          unselectedItemColor: AppColors.mainColor,
          selectedLabelStyle: const TextStyle(
            height: 2,
          ),
          unselectedLabelStyle: const TextStyle(
            height: 2,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: context.watch<MainCubit>().state,
          onTap: (index) {
            if (index == 2) {
              showCustomBottomSheet(context);
            } else {
              context.read<MainCubit>().change(index);
            }
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter: ColorFilter.mode(
                  context.watch<MainCubit>().state == 0
                      ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.buttonColor
                      : AppColors.mainColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/truck.svg',
                colorFilter: ColorFilter.mode(
                  context.watch<MainCubit>().state == 1
                      ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.buttonColor
                      : AppColors.mainColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Доставки',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/all.svg',
                colorFilter: ColorFilter.mode(
                  context.watch<MainCubit>().state == 2
                      ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.buttonColor
                      : AppColors.mainColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Все',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/send.svg',
                colorFilter: ColorFilter.mode(
                  context.watch<MainCubit>().state == 3
                      ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.buttonColor
                      : AppColors.mainColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Отправить',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                colorFilter: ColorFilter.mode(
                  context.watch<MainCubit>().state == 4
                      ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.buttonColor
                      : AppColors.mainColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }
}
