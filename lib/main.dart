import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await di.init();

  runApp(const MyApp());
}
