part of 'covid_data_cubit.dart';

@immutable
abstract class CovidDataState {
  const CovidDataState();
}

class CovidDataInitial extends CovidDataState {}

class CovidDataLoading extends CovidDataState {}

class CovidDataLoaded extends CovidDataState {
  final CovidDataResponse response;
  const CovidDataLoaded(this.response);
}

class CovidDataError extends CovidDataState {
  final String? message;
  const CovidDataError(this.message);
}
