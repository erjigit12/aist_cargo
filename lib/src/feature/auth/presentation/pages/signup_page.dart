import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<CredentialCubit, CredentialState>(
          listener: (context, state) async {
            if (state is CredentialSuccess) {
              Navigator.pushNamed(context, AppRoutes.otpCode,
                  arguments: _emailController.text);
            }
            if (state is CredentialFailure) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: _bodyWidget(context),
        ),
      ),
    );
  }

  Padding _bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Image(
                  image: AssetImage('assets/images/logo_aist_cargo.png'),
                ),
              ),
              16.h,
              const Center(
                child: Image(
                  image: AssetImage('assets/images/aistcargo.png'),
                ),
              ),
              16.h,
              const Text(
                'AistCargo - быстро и удобно передать посылку между доставщиком и отправителем',
                style: AppTextStyles.f14w400,
                textAlign: TextAlign.center,
              ),
              16.h,
              const Center(
                child: Text(
                  'Регистрация',
                  style: AppTextStyles.f20w400,
                  textAlign: TextAlign.center,
                ),
              ),
              16.h,
              Row(
                children: [
                  Expanded(
                    child: OutlineButtonWidget(
                      title: 'Google',
                      icon: 'assets/icons/google.png',
                      onPressed: () {},
                    ),
                  ),
                  8.w,
                  Expanded(
                    child: OutlineButtonWidget(
                      title: 'Apple',
                      icon: 'assets/icons/apple.png',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              16.h,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.8,
                      color: AppColors.greyBrightColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Или войти с помощью'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.8,
                      color: AppColors.greyBrightColor,
                    ),
                  ),
                ],
              ),
              32.h,

              // TEXT FIELDS
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Имя', style: AppTextStyles.f14w500),
                  8.h,
                  TextFormFieldWidget(
                    controller: _firstNameController,
                    hintText: 'Ivan',
                  ),
                  16.h,
                  const Text('Фамилия', style: AppTextStyles.f14w500),
                  8.h,
                  TextFormFieldWidget(
                    controller: _lastNameController,
                    hintText: 'Ivanov',
                  ),
                  16.h,
                  const Text('e-mail', style: AppTextStyles.f14w500),
                  8.h,
                  TextFormFieldWidget(
                    controller: _emailController,
                    hintText: 'Ivan@gmail.com',
                    validator: (val) {
                      if (val!.isValidEmail == false) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  16.h,
                  const Text('Пароль', style: AppTextStyles.f14w500),
                  8.h,
                  TextFormFieldWidget(
                    controller: _passwordController,
                    suffix: true,
                    hintText: '******',
                    validator: (val) {
                      if (val!.isValidPassword == false) {
                        return "Enter a valid password";
                      }
                      return null;
                    },
                  ),
                  16.h,
                  const Text(
                    'Подтвердите пароль',
                    style: AppTextStyles.f14w500,
                  ),
                  8.h,
                  TextFormFieldWidget(
                    controller: _confirmPasswordController,
                    suffix: true,
                    hintText: '******',
                    validator: (val) {
                      if (val!.isValidPassword == false) {
                        return "Enter a valid password";
                      }
                      return null;
                    },
                  ),
                  26.h,
                  BlocBuilder<CredentialCubit, CredentialState>(
                    builder: (context, state) {
                      if (state is CredentialLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      }
                      return ElevatedButtonWidget(
                          title: 'Продолжить',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                var snackBar = const SnackBar(
                                    content: Text('Пароли не совпадают'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                return;
                              } else {
                                context
                                    .read<CredentialCubit>()
                                    .signUp(SignupRegParams(
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ));
                              }
                            }
                          });
                    },
                  ),
                  8.h,
                  const UserAgreement(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
