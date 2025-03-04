import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              80.h,
              const Text(
                'Укажите основную информацию, чтобы завоевать больше доверие людей',
                style: AppTextStyles.f14w400,
                textAlign: TextAlign.center,
              ),
              20.h,
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              10.h,
              Text(
                "Фото пользователя",
                style:
                    AppTextStyles.f12w400.copyWith(color: AppColors.greyColor),
              ),
              20.h,
              const TextFieldWithTitle(title: 'Имя'),
              20.h,
              const TextFieldWithTitle(title: 'Фамилия'),
              20.h,
              const TextFieldWithTitle(title: 'Дата рождения'),
              20.h,
              const TextFieldWithTitle(title: 'Email для восстановление'),
              20.h,
              Row(
                children: [
                  Checkbox(
                    value: isCheck,
                    onChanged: (value) {
                      setState(() {
                        isCheck = value ?? false;
                      });
                    },
                  ),
                  Text(
                    'Даю согласие на обработку персональных данных',
                    style: AppTextStyles.f9w400
                        .copyWith(color: AppColors.blueColor),
                  ),
                ],
              ),
              20.h,
              ElevatedButtonWidget(
                title: 'Сохранить',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              20.h,
            ],
          ),
        ),
      ),
    );
  }
}
