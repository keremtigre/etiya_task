// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, unused_catch_stack

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:etiya_task/feautre/CovidData/models/covidData_model.dart';
import 'package:etiya_task/feautre/CovidData/service/ICovidDataService.dart';
import 'package:etiya_task/product/Strings/error_strings.dart';
import 'package:etiya_task/product/enums/urlPathEnum.dart';

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
        return CovidDataModel.withError(
            "S${ErrorStrings.client_error} " + response.statusCode.toString());
      }
    } catch (error, stacktrace) {
      return CovidDataModel.withError(ErrorStrings.network_error);
    }
  }
}

class NetworkError extends Error {}
