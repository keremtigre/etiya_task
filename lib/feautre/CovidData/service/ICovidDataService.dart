// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:dio/dio.dart';
import 'package:etiya_task/feautre/CovidData/models/covidData_model.dart';

abstract class ICovidDataService {
  ICovidDataService(this.dio);
  Dio dio;
  Future<CovidDataModel?> fetchCovidDataItem();
}
