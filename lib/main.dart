import 'package:device_preview/device_preview.dart';
import 'package:etiya_task/feautre/CovidData/cubit/covid_data_cubit.dart';
import 'package:etiya_task/feautre/Home/cubit/home_cubit.dart';
import 'package:etiya_task/feautre/Home/home_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CovidDataCubit())
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red.shade400,
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(),
      ),
    );
  }
}
