import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 300),
    ),
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.5,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, 10, 0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: ListTile(
                      leading: const Icon(Icons.directions_car),
                      title: const Text('Поездки'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.tripsOrParcelsPage,
                            arguments: 'Поездки');
                      },
                    ),
                  ),
                ),
                10.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: ListTile(
                      leading: const Icon(Icons.local_shipping),
                      title: const Text('Посылки'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.tripsOrParcelsPage,
                            arguments: 'Посылки');
                      },
                    ),
                  ),
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      );
    },
  );
}
