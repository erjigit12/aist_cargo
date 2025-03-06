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

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          // if (state is UserFailure) {
          //   var snackBar = SnackBar(content: Text(state.message));
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // }
          // if (state is UserSuccess) {
          //   Navigator.pop(context);
          // }
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
                        title: '${state.user.firstName}',
                      ),
                      20.h,
                      TextFieldWithTitle(
                          controller: lastNameController,
                          title: '${state.user.lastName}'),
                      20.h,
                      TextFieldWithTitle(
                          controller: dateOfBirthController,
                          title: '${state.user.dateOfBirth}'),
                      20.h,
                      TextFieldWithTitle(
                        controller: emailController,
                        title: 'Email для восстановление: ${state.user.email}',
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
                              content: Text(
                                  'Вы не дали согласие на обработку персональных данных'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final user = UserModel(
                              id: state.user.id,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              phoneNumber: state.user.phoneNumber,
                              dateOfBirth: dateOfBirthController.text,
                              image: state.user.image,
                            );
                            context.read<UserCubit>().updateUserData(user);
                            Navigator.pop(context);
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
