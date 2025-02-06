import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text(
            'Укажите основную информацию, чтобы завоевать больше доверие людей',
            style: AppTextStyles.f14w400,
          ),
        ],
      ),
    );
  }
}
