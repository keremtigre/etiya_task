// ignore: file_names
import 'package:dio/dio.dart';
import 'package:etiya_task/feautre/Home/models/country_model.dart';

abstract class ICountryService {
  ICountryService(this.dio);
  Dio dio;
  Future<Countries?> fetchCountriesItem();
}
