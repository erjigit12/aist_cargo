import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Профиль',
        icon: SizedBox(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/semi_truck.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Айжан Асылова",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "+996 503-00-00-00",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(color: Colors.orange, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Мои поездки",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Все",
                            style: TextStyle(color: Colors.orange)),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'ID ',
                      style: AppTextStyles.f12w600
                          .copyWith(color: AppColors.greyBrightColor),
                      children: [
                        TextSpan(
                          text: '50',
                          style: AppTextStyles.f12w600
                              .copyWith(color: AppColors.blackColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            8.h,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange, width: 1),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/boxx3.png', width: 40, height: 40),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Коробка M",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("65x40x25 см до 15кг",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                    ),
                    onPressed: () {},
                    child: const Text("Редактировать",
                        style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
            52.h,
            Text(
              'Профиль',
              style: AppTextStyles.f12w500
                  .copyWith(color: AppColors.greyBrightColor),
            ),
            GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.editProfile),
                child: ListTile(
                  leading: const Icon(Icons.edit, color: Colors.black54),
                  title: const Text("Редактировать профиль"),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.grey),
                  onTap: () {},
                )),
            ListTile(
              leading: const Icon(Icons.directions_car, color: Colors.black54),
              title: const Text("Мои поездки"),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.local_shipping, color: Colors.black54),
              title: const Text("Мои посылки"),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.subscriptions, color: Colors.black54),
              title: const Text("Мои подписки"),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {},
            ),
            16.h,
            Text(
              'Поддержка',
              style: AppTextStyles.f12w500
                  .copyWith(color: AppColors.greyBrightColor),
            ),
            8.h,
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.black54),
              title: const Text("Часто задаваемые вопросы"),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.black54),
              title: const Text("Политика конфиденциальности"),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.article, color: Colors.black54),
              title: const Text("Пользовательское соглашение"),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.black54),
              title: const Text("О приложении"),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Center(
                child:
                    Text("Выйти из аккаунта", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
