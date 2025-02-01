import 'package:aist_cargo/src/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OtpCodePage extends StatelessWidget {
  const OtpCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Подтверждение'),
    );
  }
}
