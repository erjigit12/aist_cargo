import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserFailure) {
            var snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is UserSuccess) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserSuccess) {
              SingleChildScrollView(
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
                        backgroundImage:
                            AssetImage('assets/images/profile.jpeg'),
                      ),
                      10.h,
                      Text(
                        "Фото пользователя",
                        style: AppTextStyles.f12w400
                            .copyWith(color: AppColors.greyColor),
                      ),
                      20.h,
                      TextFieldWithTitle(title: '${state.user.firstName}'),
                      20.h,
                      const TextFieldWithTitle(title: 'Фамилия'),
                      20.h,
                      const TextFieldWithTitle(title: 'Дата рождения'),
                      20.h,
                      const TextFieldWithTitle(
                          title: 'Email для восстановление'),
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
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
