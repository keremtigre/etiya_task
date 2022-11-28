import 'package:device_preview/device_preview.dart';
import 'package:etiya_task/feautre/CovidData/cubit/covid_data_cubit.dart';
import 'package:etiya_task/feautre/Home/cubit/home_cubit.dart';
import 'package:etiya_task/feautre/Home/home_view.dart';
import 'package:etiya_task/product/navigation/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CovidDataCubit())
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
          primaryColor: Colors.red.shade400,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.red.shade400,
          ),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.light(),
        ),
      ),
    );
  }
}
/* MaterialApp(
      home: const HomeView(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red.shade400,
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(),
      ),
    ); */