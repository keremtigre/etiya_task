import 'package:etiya_task/feature/CovidData/cubit/covid_data_cubit.dart';
import 'package:etiya_task/feature/Home/cubit/home_cubit.dart';
import 'package:etiya_task/product/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
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