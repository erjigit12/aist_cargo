import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';

class CreateDeliveryPage extends StatefulWidget {
  const CreateDeliveryPage({super.key});

  @override
  State<CreateDeliveryPage> createState() => _CreateDeliveryPageState();
}

class _CreateDeliveryPageState extends State<CreateDeliveryPage> {
  int selectedCardIndex = -1;
  int selectedSubscriptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Самолет'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Откуда, куда и когда вы едете?',
                style: AppTextStyles.f12w600,
              ),
              const SizedBox(height: 16),
              const TextFieldWidget(hintText: 'Москва'),
              const SizedBox(height: 16),
              const TextFieldWidget(hintText: 'Ош'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: '24.01.2025',
                      prefixIcon: Image.asset(
                        'assets/icons/airplane_on.png',
                      ),
                    ),
                  ),
                  8.w,
                  Expanded(
                    child: TextFieldWidget(
                      hintText: '28.01.2025',
                      prefixIcon: Image.asset(
                        'assets/icons/airplane_off.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Какие посылки вы готовы доставить?',
                style: AppTextStyles.f12w600,
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardIndex = index;
                      });
                    },
                    child: _buildProductCard(
                      image: 'assets/images/boxx3.png',
                      title: 'Коробка M',
                      subtitle: '55х40x20 см до 10кг',
                      isSelected: selectedCardIndex == index,
                    ),
                  );
                },
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
              32.h,
              ElevatedButtonWidget(
                title: 'Создать поездку',
                onPressed: () async {
                  showSubscriptionBottomSheet(context);
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
    required String image,
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? Colors.orange : Colors.transparent,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.f12w600
                      .copyWith(color: AppColors.textColor),
                ),
                5.h,
                Text(
                  subtitle,
                  style: AppTextStyles.f10w400
                      .copyWith(color: AppColors.textColor),
                ),
              ],
            ),
          ),
          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: AppColors.buttonColor,
              size: 26,
            ),
        ],
      ),
    );
  }

  void showSubscriptionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
      ),
      isScrollControlled: true, // Управление высотой BottomSheet
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          int localSelectedSubscriptionIndex = selectedSubscriptionIndex;

          return FractionallySizedBox(
            heightFactor: 0.7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Чтобы открыть следующую страницу, необходимо подписаться на один из тарифов.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.f14w400.copyWith(
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubscriptionButton(
                          text: 'Подключить за 99Р на 1 месяц',
                          color: AppColors.subscribeGreenColor,
                          index: 1,
                          currentIndex: localSelectedSubscriptionIndex,
                          onSelect: (index) {
                            setModalState(() {
                              localSelectedSubscriptionIndex = index;
                            });
                            setState(() {
                              selectedSubscriptionIndex = index;
                            });
                          },
                        ),
                        8.h,
                        SubscriptionButton(
                          text: 'Подключить за 999Р на 3 месяцев',
                          color: AppColors.subscribeBlueColor,
                          index: 2,
                          currentIndex: localSelectedSubscriptionIndex,
                          onSelect: (index) {
                            setModalState(() {
                              localSelectedSubscriptionIndex = index;
                            });
                            setState(() {
                              selectedSubscriptionIndex = index;
                            });
                          },
                        ),
                        8.h,
                        SubscriptionButton(
                          text: 'Подключить за 1499Р на 6 месяцев',
                          color: AppColors.subscribeRedColor,
                          index: 3,
                          currentIndex: localSelectedSubscriptionIndex,
                          onSelect: (index) {
                            setModalState(() {
                              localSelectedSubscriptionIndex = index;
                            });
                            setState(() {
                              selectedSubscriptionIndex = index;
                            });
                          },
                        ),
                        8.h,
                        SubscriptionButton(
                          text: 'Подключить за 1999Р на 12 месяцев',
                          color: AppColors.subscribeYellowColor,
                          index: 4,
                          currentIndex: localSelectedSubscriptionIndex,
                          onSelect: (index) {
                            setModalState(() {
                              localSelectedSubscriptionIndex = index;
                            });
                            setState(() {
                              selectedSubscriptionIndex = index;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  24.h,
                  ElevatedButtonWidget(
                      title: 'Подключить',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.addCardPage);
                      }),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
