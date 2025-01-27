import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Создать поездку'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            30.h,
            const TextFieldWithTitle(
              title: 'ФИО',
              hintText: 'Иванов Иван',
            ),
            20.h,
            const TextFieldWithTitle(
              title: 'Номер телефона',
              hintText: '+996 774 29 81 79',
            ),
          ],
        ),
      ),
    );
  }
}
