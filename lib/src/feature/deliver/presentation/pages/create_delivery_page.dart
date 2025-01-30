import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';

// Модель для посылки
class PackageOption {
  final String title;
  final String size;

  PackageOption({required this.title, required this.size});
}

class CreateDeliveryPage extends StatefulWidget {
  final String appBar;
  const CreateDeliveryPage({super.key, required this.appBar});

  @override
  State<CreateDeliveryPage> createState() => _CreateDeliveryPageState();
}

class _CreateDeliveryPageState extends State<CreateDeliveryPage> {
  int selectedCardIndex = -1;

  final List<PackageOption> packageOptions = [
    PackageOption(title: 'Документ/Конверт', size: 'A4 30x21 см до 0.5кг'),
    PackageOption(title: 'Коробка S', size: '55x40x20 см до 10кг'),
    PackageOption(title: 'Коробка M', size: '65x40x25 см до 15кг'),
    PackageOption(title: 'Коробка L', size: '55x40x20 см до 10кг'),
    PackageOption(title: 'Сумка/Чемодан S', size: '55x40x20 см до 10кг'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.appBar),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Text('Откуда, куда и когда вы едете?',
                style: AppTextStyles.f12w600),
            16.h,
            const TextFieldWidget(hintText: 'Москва'),
            16.h,
            const TextFieldWidget(hintText: 'Ош'),
            16.h,
            Row(
              children: [
                const Expanded(child: TextFieldWidget(hintText: '24.01.2025')),
                8.w,
                const Expanded(child: TextFieldWidget(hintText: '28.01.2025')),
              ],
            ),
            32.h,
            const Text('Какие посылки вы готовы доставить?',
                style: AppTextStyles.f12w600),
            const SizedBox(height: 16),
            Column(
              children: List.generate(packageOptions.length, (index) {
                final package = packageOptions[index];
                return GestureDetector(
                  onTap: () => setState(() => selectedCardIndex = index),
                  child: _buildProductCard(
                    title: package.title,
                    subtitle: package.size,
                    isSelected: selectedCardIndex == index,
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
            32.h,
            ElevatedButtonWidget(title: 'Создать поездку', onPressed: () {}),
            32.h,
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      {required String title,
      required String subtitle,
      required bool isSelected}) {
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
}
