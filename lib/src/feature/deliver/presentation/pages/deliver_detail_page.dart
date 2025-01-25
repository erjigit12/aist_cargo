import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class DeliverDetailPage extends StatelessWidget {
  const DeliverDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text('Откуда, куда и когда вы едете?',
                style: AppTextStyles.f12w600),
          ],
        ),
      ),
    );
  }
}
