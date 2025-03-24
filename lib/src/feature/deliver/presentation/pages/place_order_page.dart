import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key, required this.packageOptions});

  final List<PackageOption> packageOptions;

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  // int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    final deliveryCubit = context.read<DeliveryCubit>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Создать поездку'),
      body: BlocListener<DeliveryCubit, DeliveryState>(
        listener: (context, state) {
          if (state is DeliveryFailure) {
            var snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is DeliverySuccess) {
            showSubscriptionBottomSheet(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              30.h,
              const TextFieldWithTitle(
                title: 'ФИО',
                hintText: 'Иванов Иван',
              ),
              20.h,
              const TextFieldWithTitle(
                title: 'Номер телефона',
                hintText: '+996 774 29 81 79',
              ),
              20.h,
              TextFieldWithTitle(
                title: 'Откуда',
                hintText: deliveryCubit.fromWhere,
              ),
              20.h,
              TextFieldWithTitle(
                title: 'Куда',
                hintText: deliveryCubit.toWhere,
              ),
              20.h,
              TextFieldWithTitle(
                title: 'Дата вылета',
                hintText: deliveryCubit.dispatchDate,
              ),
              20.h,
              TextFieldWithTitle(
                title: 'Дата прилета',
                hintText: deliveryCubit.arrivalDate,
              ),
              20.h,
              TextFieldWithTitle(
                title: 'Дата прилета',
                hintText: deliveryCubit.boxType.toString(),
              ),
              8.h,
              const Text(
                'Какие посылки вы готовы доставить?',
                style: AppTextStyles.f12w600,
              ),
              16.h,
              Column(
                children: List.generate(widget.packageOptions.length, (index) {
                  final package = widget.packageOptions[index];
                  return GestureDetector(
                    onTap: () => setState(() => deliveryCubit.boxType = index),
                    child: _buildProductCard(
                      type: package.type,
                      title: package.title,
                      subtitle: package.size,
                      isSelected: deliveryCubit.boxType == index,
                      // image: 'assets/images/truck_lx3.png',
                    ),
                  );
                }),
              ),
              32.h,
              Text(
                'Допольнительная информация о поездке',
                style: AppTextStyles.f12w400.copyWith(
                  color: AppColors.greyBrightColor,
                ),
              ),
              8.h,
              TextFormField(
                initialValue: deliveryCubit.description,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: 'Я даю гарантию безопасную транспортировку.',
                  hintStyle: AppTextStyles.f12w400
                      .copyWith(color: AppColors.textColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.blackColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.blackColor,
                      width: 1,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                maxLines: null,
                minLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              31.h,
              BlocBuilder<DeliveryCubit, DeliveryState>(
                builder: (context, state) {
                  if (state is DeliveryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButtonWidget(
                    title: 'Оформить',
                    onPressed: () async {
                      // showSubscriptionBottomSheet(context);
                      context
                          .read<DeliveryCubit>()
                          .createDelivery(CreateDeliveryModel(
                            userName: 'Манас Манасович',
                            fromWhere: 'Алматы',
                            toWhere: 'Ыссык-Куль',
                            dispatchDate: '2025-03-23',
                            arrivalDate: '2025-03-28',
                            size: widget
                                .packageOptions[deliveryCubit.boxType].type,
                            transportNumber: 'AWC231F',
                          ));
                    },
                  );
                },
              ),
              32.h,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String subtitle,
    required bool isSelected,
    required String type,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
            color: isSelected ? Colors.orange : Colors.transparent, width: 2),
      ),
      child: ListTile(
        title: Text(title, style: AppTextStyles.f12w600),
        subtitle: Text(subtitle, style: AppTextStyles.f10w400),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: Colors.orange)
            : null,
      ),
    );
  }

  // Widget _buildProductCard({
  //   required String image,
  //   required String title,
  //   required String subtitle,
  //   required bool isSelected,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 16),
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(24),
  //       border: Border.all(
  //         color: isSelected ? Colors.orange : Colors.transparent,
  //         width: 2,
  //       ),
  //       boxShadow: const [
  //         BoxShadow(
  //           color: Colors.black12,
  //           blurRadius: 6,
  //           offset: Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(50),
  //           child: Image.asset(
  //             image,
  //             width: 50,
  //             height: 50,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         const SizedBox(width: 16),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 title,
  //                 style: AppTextStyles.f12w600
  //                     .copyWith(color: AppColors.textColor),
  //               ),
  //               5.h,
  //               Text(
  //                 subtitle,
  //                 style: AppTextStyles.f10w400
  //                     .copyWith(color: AppColors.textColor),
  //               ),
  //             ],
  //           ),
  //         ),
  //         if (isSelected)
  //           const Icon(
  //             Icons.check_circle,
  //             color: AppColors.buttonColor,
  //             size: 26,
  //           ),
  //       ],
  //     ),
  //   );
  // }

  void showSubscriptionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                Text(
                  'Поездка (номер генерируется автоматически)',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.f10w400.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                8.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: const Size(
                              double.infinity,
                              60,
                            ),
                            side: const BorderSide(
                                color: AppColors.greyBrightColor),
                          ),
                          child: Text(
                            '№12345',
                            style: AppTextStyles.f20w500.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                24.h,
                Text(
                  'Спасибо!',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.f24w400.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                24.h,
                Text(
                  'Ваша поездка успешно обработана!',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.f18w400.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                const Spacer(flex: 2),
                ElevatedButtonWidget(
                  title: 'Ок',
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.main,
                    (route) => false,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        );
      },
    );
  }
}
