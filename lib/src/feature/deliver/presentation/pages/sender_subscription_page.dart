import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class SenderSubscriptionPage extends StatelessWidget {
  const SenderSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Подключить Подписку',
      ),
      body: Column(
        children: [
          Image.asset('assets/images/sender.png'),
        ],
      ),
    );
  }
}
