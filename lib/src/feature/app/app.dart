import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aist_cargo/injection_container.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<MainCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<OtpBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aist Cargo',
        theme: ThemeData(),
        onGenerateRoute: RouteGenerator.onGenerate,
        initialRoute: 'login',
      ),
    );
  }
}
