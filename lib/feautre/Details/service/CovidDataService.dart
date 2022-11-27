import 'dart:io';

import 'package:dio/dio.dart';
import 'package:etiya_task/feautre/CovidData/models/covidData_model.dart';
import 'package:etiya_task/feautre/CovidData/service/ICovidDataService.dart';
import 'package:etiya_task/feautre/Home/models/country_model.dart';
import 'package:etiya_task/feautre/Home/service/ICountryService.dart';
import 'package:etiya_task/product/Strings/error_strings.dart';
import 'package:etiya_task/product/enums/urlPathEnum.dart';
import 'package:flutter/material.dart';

class CovidDataService extends ICovidDataService {
  CovidDataService(Dio dio) : super(dio);
  @override
  Future<CovidDataModel> fetchCovidDataItem() async {
    try {
      final response = await dio.get(
        "/${UrlPathsEnum.statistics.name}",
      );
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        return CovidDataModel.fromJson(jsonBody);
      } else {
        debugPrint(
            "COVID DATA SERVICE ERROR(STATUS): ${ErrorStrings.client_error} " +
                response.statusCode.toString());
        return CovidDataModel.withError(
            "S${ErrorStrings.client_error} " + response.statusCode.toString());
      }
    } catch (error, stacktrace) {
      debugPrint(
          "COVID DATA SERVICE ERROR (CATCH): " + ErrorStrings.network_error);
      return CovidDataModel.withError(ErrorStrings.network_error);
    }
  }
}

class NetworkError extends Error {}
