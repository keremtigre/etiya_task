// ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:etiya_task/feature/Home/models/country_model.dart';
import 'package:etiya_task/feature/Home/service/CountryService.dart';
import 'package:etiya_task/product/Strings/error_strings.dart';
import 'package:etiya_task/product/Strings/network/network_strings.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    init();
  }
  late CountryService _countryService;
  late Countries countryModel;
  late List<String> tempCountry = [];
  TextEditingController searchTextController = TextEditingController();

  Future init() async {
    try {
      emit(HomeLoading());
      //init CountryService
      _countryService = CountryService(
          Dio(BaseOptions(baseUrl: NetworkStrings.baseUrl, headers: {
        "X-RapidAPI-Key": NetworkStrings.api_key,
      })));
      //get data
      countryModel = await _countryService.fetchCountriesItem();
      tempCountry = countryModel.response ?? [];
      emit(HomeLoaded());
      // if has error, change state to homeError
      if (countryModel.error != null) {
        emit(HomeError(countryModel.error));
      }
    } on NetworkError {
      emit(HomeError(ErrorStrings.network_error));
    }
  }

  textFormOnChanged() {
    if (searchTextController.text.isEmpty) {
      tempCountry = countryModel.response ?? [];
      emit(HomeLoaded());
    } else {
      tempCountry = countryModel.response ?? [];
      tempCountry = tempCountry.where((s) {
        String _value = searchTextController.text.toLowerCase();

        if (s.toLowerCase().contains(_value)) {
          return true;
        }
        return false;
      }).toList();
      emit(HomeLoaded());
    }
  }
}
