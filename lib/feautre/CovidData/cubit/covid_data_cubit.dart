// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:etiya_task/feautre/CovidData/models/covidData_model.dart';
import 'package:etiya_task/feautre/CovidData/service/CovidDataService.dart';
import 'package:etiya_task/product/Strings/error_strings.dart';
import 'package:etiya_task/product/Strings/network/network_strings.dart';
import 'package:meta/meta.dart';

part 'covid_data_state.dart';

class CovidDataCubit extends Cubit<CovidDataState> {
  CovidDataCubit() : super(CovidDataInitial());
  // ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

  late CovidDataService _covidService;
  late CovidDataModel covidModel;
  int currentIndex = 0;
  //for index_viewer
  setCurrentIndex(int value) {
    currentIndex = value;
    emit(CovidDataLoaded(covidModel.response![0]));
  }

  init(String country) async {
    currentIndex = 0;
    try {
      emit(CovidDataLoading());
      //init CountryService
      late CovidDataService _covidService = CovidDataService(
          Dio(BaseOptions(baseUrl: NetworkStrings.baseUrl, queryParameters: {
        "country": country
      }, headers: {
        "X-RapidAPI-Key": NetworkStrings.api_key,
      })));
      // getData
      covidModel = await _covidService.fetchCovidDataItem().catchError((error) {
        emit(CovidDataError(covidModel.error));
      });
      //if has error change state to CovidDataError
      if (covidModel.error != null) {
        emit(CovidDataError(covidModel.error));
      }
      emit(CovidDataLoaded(covidModel.response![0]));
    } on NetworkError {
      emit(CovidDataError(ErrorStrings.network_error));
    }
  }
}
