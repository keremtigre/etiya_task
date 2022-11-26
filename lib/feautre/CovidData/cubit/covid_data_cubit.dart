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

  late CovidDataService _countryService;
  late CovidDataModel covidModel;
  int currentIndex = 0;
  setCurrentIndex(int value) {
    currentIndex = value;
    emit(CovidDataLoaded(covidModel.response![0]));
  }

  init(String country) async {
    currentIndex = 0;
    try {
      emit(CovidDataLoading());
      _countryService = CovidDataService(
          Dio(BaseOptions(baseUrl: NetworkStrings.baseUrl, queryParameters: {
        "country": country
      }, headers: {
        "X-RapidAPI-Key": NetworkStrings.api_key,
      })));
      covidModel = await _countryService.fetchCovidDataItem();
      if (covidModel.error != null) {
        emit(CovidDataError(covidModel.error));
      }

      emit(CovidDataLoaded(covidModel.response![0]));
    } on NetworkError {
      emit(CovidDataError(ErrorStrings.network_error));
    }
  }
}
