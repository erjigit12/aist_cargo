import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aist Cargo',
      theme: ThemeData(),
      onGenerateRoute: RouteGenerator.onGenerate,
      initialRoute: '/',
    );
  }
}
