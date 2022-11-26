// ignore: file_names
import 'package:dio/dio.dart';
import 'package:etiya_task/feautre/CovidData/models/covidData_model.dart';
import 'package:etiya_task/feautre/Home/models/country_model.dart';

abstract class ICovidDataService {
  ICovidDataService(this.dio);
  Dio dio;
  Future<CovidDataModel?> fetchCovidDataItem();
}
