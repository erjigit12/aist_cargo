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
  late UserCubit _userCubit;

  // Контроллеры будем инициализировать в initState
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();

    // Инициализируем контроллеры с текущими значениями
    _initializeControllers();
  }

  void _initializeControllers() {
    final currentState = _userCubit.state;

    if (currentState is UserSuccess) {
      firstNameController =
          TextEditingController(text: currentState.user.firstName);
      lastNameController =
          TextEditingController(text: currentState.user.lastName);
      dateOfBirthController =
          TextEditingController(text: currentState.user.dateOfBirth);
      emailController = TextEditingController(text: currentState.user.email);
    } else {
      // Запасные значения
      firstNameController = TextEditingController();
      lastNameController = TextEditingController();
      dateOfBirthController = TextEditingController();
      emailController = TextEditingController();
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is UserSuccess && state.isUpdated) {
            // Navigator.pop(context);
          }
        },
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserSuccess) {
              return SingleChildScrollView(
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
                      TextFieldWithTitle(
                        controller: firstNameController,
                        title: 'Имя',
                        onChanged: (value) {},
                      ),
                      20.h,
                      TextFieldWithTitle(
                        controller: lastNameController,
                        title: 'Фамилия',
                        onChanged: (value) {},
                      ),
                      20.h,
                      TextFieldWithTitle(
                        controller: dateOfBirthController,
                        title: 'День рождения',
                        onChanged: (value) {},
                      ),
                      20.h,
                      TextFieldWithTitle(
                        controller: emailController,
                        title: 'Email для восстановление:',
                        isRead: true,
                      ),
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
                          if (!isCheck) {
                            var snackBar = const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                  'Вы не дали согласие на обработку персональных данных'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final user = UserModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: state.user.email,
                              phoneNumber: state.user.phoneNumber,
                              dateOfBirth: dateOfBirthController.text,
                              image: '',
                            );
                            context.read<UserCubit>().updateUserData(user);
                          }
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
