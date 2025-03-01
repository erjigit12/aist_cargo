import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<CredentialCubit, CredentialState>(
        listener: (context, state) {
          if (state is CredentialSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.main, (route) => false);
          }
          if (state is CredentialFailure) {
            var snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: _bodyWidget(context),
      ),
    );
  }

  Form _bodyWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                'Вход',
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
                TextFieldWithTitle(
                  controller: _emailController,
                  title: 'Электронная почта',
                  backgroundColor: Colors.transparent,
                  hintText: 'Электронная почта',
                  keyboardType: TextInputType.emailAddress,
                ),
                16.h,
                TextFieldWithTitle(
                  controller: _passwordController,
                  title: 'Пароль',
                  backgroundColor: Colors.transparent,
                  hintText: 'Пароль',
                  keyboardType: TextInputType.visiblePassword,
                  suffix: true,
                ),
                8.h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, 'forgotPassword'),
                      child: Text(
                        'Забыли пароль?',
                        style: AppTextStyles.f14w500.copyWith(
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
                16.h,
                BlocBuilder<CredentialCubit, CredentialState>(
                  builder: (context, state) {
                    if (state is CredentialLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    return ElevatedButtonWidget(
                        key: _formKey,
                        title: 'Продолжить',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<CredentialCubit>().signIn(
                                  SigninRegParams(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        });
                  },
                ),
                8.h,
                const UserAgreement(),
                26.h,
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: Text(
                      'Регистрация',
                      style: AppTextStyles.f14w500.copyWith(
                        color: AppColors.blueColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blueColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
