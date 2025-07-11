import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.name,
    required this.tripNumber,
    required this.from,
    required this.to,
    required this.departureDate,
    required this.arrivalDate,
    this.packageType,
    required this.packageSize,
    required this.profileImageUrl,
    this.autoNumber,
    this.isParcel,
    required this.title,
    required this.description,
  });

  final String title;
  final String name;
  final String tripNumber;
  final String from;
  final String to;
  final String departureDate;
  final String arrivalDate;
  final String? packageType;
  final String packageSize;
  final String? autoNumber;
  final String profileImageUrl;
  final bool? isParcel;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
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
                    child: Text(title, style: AppTextStyles.f14w400),
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
                child: Text(
                  description,
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
                      Text(
                        from,
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
                      const Text(
                        'Каробка',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        to,
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

              isParcel == true
                  ? Padding(
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
                    )
                  : const SizedBox(),
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
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(profileImageUrl),
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
