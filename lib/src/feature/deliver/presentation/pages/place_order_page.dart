import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Создать поездку'),
      body: Padding(
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
            const TextFieldWithTitle(
              title: 'Откуда',
              hintText: 'Москва',
            ),
            20.h,
            const TextFieldWithTitle(
              title: 'Куда',
              hintText: 'Ош',
            ),
            20.h,
            const TextFieldWithTitle(
              title: 'Дата вылета',
              hintText: '24.01.2025',
            ),
            20.h,
            const TextFieldWithTitle(
              title: 'Дата прилета',
              hintText: '28.01.2025',
            ),
            8.h,
            const Text(
              'Какие посылки вы готовы доставить?',
              style: AppTextStyles.f12w600,
            ),
            16.h,
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
                hintStyle:
                    AppTextStyles.f12w400.copyWith(color: AppColors.textColor),
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
            ElevatedButtonWidget(
              title: 'Оформить',
              onPressed: () async {
                showSubscriptionBottomSheet(context);
              },
            ),
            32.h,
          ],
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
