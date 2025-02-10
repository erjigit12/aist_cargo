import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final String name;
  final String tripNumber;
  final String from;
  final String to;
  final String departureDate;
  final String arrivalDate;
  final String packageType;
  final String packageSize;
  final String? autoNumber;
  final String profileImageUrl;

  const TripCard({
    super.key,
    required this.name,
    required this.tripNumber,
    required this.from,
    required this.to,
    required this.departureDate,
    required this.arrivalDate,
    required this.packageType,
    required this.packageSize,
    required this.profileImageUrl,
    this.autoNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Позволяет выходить за границы
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.buttonColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              85.h,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Поездка', style: AppTextStyles.f14w400),
                  ),
                  Text(
                    '№ $tripNumber',
                    style: AppTextStyles.f18w700,
                  ),
                ],
              ),
              8.h,

              // Описание
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3,
                ),
                child: const Text(
                  'Я даю гарантию безопасную транспортировку.',
                  style: AppTextStyles.f12w400,
                ),
              ),
              8.h,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Бишкек',
                        style: AppTextStyles.f12w700,
                      ),
                      const Text(
                        'Дата вылета',
                        style: AppTextStyles.f12w600,
                      ),
                      const Text(
                        'Дата прилёта',
                        style: AppTextStyles.f12w600,
                      ),
                      const Text(
                        'Авто номер',
                        style: AppTextStyles.f12w600,
                      ),
                      Text(
                        packageType,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Баткен',
                        style: AppTextStyles.f12w700,
                      ),
                      Text(
                        departureDate,
                        style: AppTextStyles.f12w400,
                      ),
                      Text(
                        arrivalDate,
                        style: AppTextStyles.f12w400,
                      ),
                      Text(
                        autoNumber ?? '',
                        style: AppTextStyles.f12w400,
                      ),
                      Text(
                        packageSize,
                        style: AppTextStyles.f12w400,
                      ),
                    ],
                  ),
                ],
              ),
              8.h,

              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButtonWidget(
                        title: 'Архивировать',
                        onPressed: () {},
                        backgroundColor: AppColors.whiteColor,
                        side: const BorderSide(
                          color: AppColors.blackColor,
                          width: 0.3,
                        ),
                        style: AppTextStyles.f10w500
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButtonWidget(
                        title: 'Редактировать',
                        onPressed: () {},
                        style: AppTextStyles.f10w500
                            .copyWith(color: AppColors.textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -30,
          left: 16,
          right: 16,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
                Text(
                  name,
                  style: AppTextStyles.f15w500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
