import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodePage extends StatelessWidget {
  final String email;
  const OtpCodePage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppBar(title: 'Подтверждения'),
      body: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Код подтвержден!")),
            );
            Navigator.pushNamed(context, 'main');
          } else if (state is OtpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Введите код подтверждения:\n$email",
                  style: AppTextStyles.f14w500
                      .copyWith(color: AppColors.greyTextColor),
                ),
                40.h,
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  onCompleted: (value) {
                    context.read<OtpBloc>().add(OtpSubmitted(value));
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 75,
                    fieldWidth: 75,
                    activeFillColor: AppColors.whiteColor,
                    inactiveFillColor: AppColors.whiteColor,
                    selectedFillColor: AppColors.whiteColor,
                    activeColor: AppColors.blackColor,
                    inactiveColor: AppColors.greyBorderColor,
                    selectedColor: Colors.blue,
                    borderWidth: 1.5,
                  ),
                  enableActiveFill: true,
                ),
                Center(
                    child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Не получили код?  ",
                        style: AppTextStyles.f14w500
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      TextSpan(
                        text: "Отправить повторно",
                        style: AppTextStyles.f14w500
                            .copyWith(color: AppColors.buttonColor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                )),
                const Spacer(),
                if (state is OtpLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  Center(
                    child: ElevatedButtonWidget(
                      title: state is OtpLoading
                          ? 'Подтверждение...'
                          : 'Подтвердить',
                      onPressed: () {},
                    ),
                  ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
