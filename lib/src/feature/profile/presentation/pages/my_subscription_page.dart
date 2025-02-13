import 'package:aist_cargo/src/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MySubscriptionPage extends StatelessWidget {
  const MySubscriptionPage({
    super.key,
    required this.appBarTitle,
  });

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appBarTitle),
    );
  }
}
