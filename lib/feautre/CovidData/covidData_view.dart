library covidData_view.dart;

import 'package:etiya_task/feautre/CovidData/cubit/covid_data_cubit.dart';
import 'package:etiya_task/feautre/CovidData/models/covidData_model.dart';
import 'package:etiya_task/product/Strings/covidDataPage_strings.dart';
import 'package:etiya_task/product/Widget/covid_data_card.dart';
import 'package:etiya_task/product/Widget/index_viewer.dart';
import 'package:etiya_task/product/Widget/scaffold_messenger.dart';
import 'package:etiya_task/product/enums/lottie_path_enum.dart';
import 'package:etiya_task/product/mixin/NetworkImagePathExtension.dart';
import 'package:etiya_task/product/mixin/numberFormat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
part 'parts/build_IndexViewer.dart';
part 'parts/build_countryInfo.dart';
part 'parts/build_gridView.dart';

class CovidDataPage extends StatefulWidget {
  final String countryName;
  const CovidDataPage({super.key, required this.countryName});

  @override
  State<CovidDataPage> createState() => _CovidDataPageState();
}

class _CovidDataPageState extends State<CovidDataPage>
    with NetworkImagePathExtansion, NumberFormat, LottiePathEnumExtension {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<CovidDataCubit>().init(widget.countryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.countryName),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          height: context.height,
          width: context.width,
          margin: EdgeInsets.all(8.0),
          child: BlocConsumer<CovidDataCubit, CovidDataState>(
            listener: (context, state) {
              if (state is CovidDataError) {
                scaffoldMessengerHelper(context, state.message ?? "", 5);
              }
            },
            builder: (context, state) {
              if (state is CovidDataInitial) {
                return toWidget(LottiePathEnum.loading.name);
              } else if (state is CovidDataLoading) {
                return toWidget(LottiePathEnum.loading.name);
              } else if (state is CovidDataLoaded) {
                return _BuildGridView(
                    context, state.response, widget.countryName);
              } else if (state is CovidDataError) {
                return Center(
                  child: toWidget(LottiePathEnum.error.name),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
