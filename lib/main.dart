import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'src/core/constant/generated/strings.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  LocaleSettings.useDeviceLocale();
  runApp(const MyApp());
}
