import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Введите код подтверждения:",
                style: TextStyle(fontSize: 16)),
            Text(email,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            BlocConsumer<OtpBloc, OtpState>(
              listener: (context, state) {
                if (state is OtpSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Код подтвержден!")),
                  );
                  Navigator.pushNamed(context, '/main');
                } else if (state is OtpFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      onCompleted: (value) {
                        context.read<OtpBloc>().add(OtpSubmitted(value));
                      },
                    ),
                    const SizedBox(height: 20),
                    if (state is OtpLoading)
                      const CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: () async {
                          context.read<OtpBloc>().add(OtpSubmitted(''));
                        },
                        child: const Text("Продолжить"),
                      ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Отправить повторно",
                          style: TextStyle(color: Colors.orange)),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
