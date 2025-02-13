import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

void showCustomBottomSheet(
  BuildContext context, {
  String? title,
  String? listTitle1,
  String? listTitle2,
  void Function()? onTap1,
  void Function()? onTap2,
}) {
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
                Text(title ?? '', style: AppTextStyles.f20w500),
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
                      leading: Image.asset('assets/icons/tourist.png'),
                      title: Text(listTitle1 ?? ''),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: onTap1,
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
                      leading: Image.asset('assets/icons/worker.png'),
                      title: Text(listTitle2 ?? ''),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: onTap2,
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
