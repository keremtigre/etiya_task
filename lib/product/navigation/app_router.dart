import 'package:auto_route/auto_route.dart';
import 'package:etiya_task/feautre/CovidData/covidData_view.dart';
import 'package:etiya_task/feautre/Home/home_view.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true, path: "/home"),
    AutoRoute(page: CovidDataView, path: "/details"),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
