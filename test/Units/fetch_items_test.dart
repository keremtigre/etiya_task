//  no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:etiya_task/feature/CovidData/service/CovidDataService.dart';
import 'package:etiya_task/feature/Home/service/CountryService.dart';
import 'package:etiya_task/product/Strings/network/network_strings.dart';
import 'package:etiya_task/product/enums/urlPathEnum.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  const _base_url = NetworkStrings.baseUrl;
  const _api_key = NetworkStrings.api_key;
  group("Fetch Items Test", () {
    //Countries Fetch Service Test
    test("Countries Service Test", () async {
      final _countries =
          await CountryService(Dio(BaseOptions(baseUrl: _base_url, headers: {
        "X-RapidAPI-Key": _api_key,
      }))).fetchCountriesItem();
      print(_countries..response?[0].toString());
      expect(_countries.response?.isNotEmpty, true);
    });
    // Covid-19 Data Fetch Service Test (optional value : country = Turkey)
    test("Covid-19 Data Service Test", () async {
      final _covidModelData = await CovidDataService(
          Dio(BaseOptions(baseUrl: _base_url, queryParameters: {
        "country": "Turkey"
      }, headers: {
        "X-RapidAPI-Key": _api_key,
      }))).fetchCovidDataItem();
      print(_covidModelData.response?[0].country);
      expect(_covidModelData.response?[0].country?.contains("Turkey"), true);
    });
  });
}
