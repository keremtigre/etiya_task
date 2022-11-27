import 'dart:io';

import 'package:dio/dio.dart';
import 'package:etiya_task/feautre/Home/models/country_model.dart';
import 'package:etiya_task/feautre/Home/service/ICountryService.dart';
import 'package:etiya_task/product/Strings/error_strings.dart';
import 'package:etiya_task/product/enums/urlPathEnum.dart';

class CountryService extends ICountryService {
  CountryService(Dio dio) : super(dio);
  @override
  Future<Countries> fetchCountriesItem() async {
    try {
      final response = await dio.get(
        "/${UrlPathsEnum.countries.name}",
      );
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        return Countries.fromJson(jsonBody);
      } else {
        print(
            "Exception (COUNTRY SERVICE - STATUS): ${ErrorStrings.client_error} " +
                response.statusCode.toString());
        return Countries.withError(
            "${ErrorStrings.client_error} " + response.statusCode.toString());
      }
    } catch (error, stacktrace) {
      print(
          "Exception (COUNTRY SERVICE - CATCHED): $error stackTrace: $stacktrace");
      return Countries.withError(ErrorStrings.network_error);
    }
  }
}

class NetworkError extends Error {}
