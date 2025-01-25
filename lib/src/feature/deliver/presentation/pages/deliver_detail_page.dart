import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';

class DeliverDetailPage extends StatefulWidget {
  const DeliverDetailPage({super.key});

  @override
  State<DeliverDetailPage> createState() => _DeliverDetailPageState();
}

class _DeliverDetailPageState extends State<DeliverDetailPage> {
  int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
              16.h,
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
}
