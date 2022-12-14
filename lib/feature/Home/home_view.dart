library home_view.dart;

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:etiya_task/core/constants/app/app_constants.dart';
import 'package:etiya_task/feature/CovidData/covidData_view.dart';
import 'package:etiya_task/feature/Home/cubit/home_cubit.dart';
import 'package:etiya_task/feature/Home/service/CountryService.dart';
import 'package:etiya_task/product/Strings/network/homePage_strings.dart';
import 'package:etiya_task/product/Widget/reload_button.dart';
import 'package:etiya_task/product/Widget/scaffold_messenger.dart';
import 'package:etiya_task/product/enums/lottie_path_enum.dart';
import 'package:etiya_task/product/mixin/NetworkImagePathExtension.dart';
import 'package:etiya_task/product/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
part 'parts/build_ListCountries.dart';
part 'parts/build_countryCard.dart';
part 'parts/build_pages.dart';
part 'parts/build_searchWidget.dart';
part 'parts/build_noDataFoundWidget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomeCubit>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          reloadButton(
            context,
            () async => await context.read<HomeCubit>().init(),
          )
        ],
        centerTitle: true,
        title: const Text(
          ApplicationConstants.app_name,
        ),
      ),
      body: const BuildPages(),
    );
  }
}
