import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../../common/constants/theme.dart';
import '../model/air_quality.dart';
import '../model/predict_air_quality.dart';

class AirQualityRepository {
  final List<AirQuality> listResult = [];
  Future<AirQuality> getAqiHourly(
      String cityName, String date, String hour) async {
    Response? response;
    try {
      response = await Dio()
          .get('http://14.225.255.164:7899/v1/$cityName/$date%20$hour:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return AirQuality.fromJson(response?.data);
  }

  Future<List<AirQuality>> getListAqiHourly(
      List<String> cityNames, String date, String hour) async {
    listResult.clear();
    for (final name in cityNames) {
      final aqi = await getAqiHourly(name, date, hour);
      listResult.add(aqi);
    }
    return listResult;
  }

  Future<List<PredictAirQuality>> getDeepQLPredictAqiHourly(String hour, String cityName) async {
    Response? response;
    try {
      response = await Dio().get(
          'http://14.225.255.164:7899/v1/Forecast/DeepQLearning/$cityName/$hour:00:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return (response?.data as List)
        .map((x) => PredictAirQuality.fromJson(x))
        .toList();
  }

  Future<List<PredictAirQuality>> getLSTMPredictAqiHourly(String hour, String cityName) async {
    Response? response;
    try {
      response = await Dio().get(
          'http://14.225.255.164:7899/v1/Forecast/LSTM/$cityName/$hour:00:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return (response?.data as List)
        .map((x) => PredictAirQuality.fromJson(x))
        .toList();
  }

  Future<List<PredictAirQuality>> getRNNPredictAqiHourly(String hour, String cityName) async {
    Response? response;
    try {
      response = await Dio().get(
          'http://14.225.255.164:7899/v1/Forecast/RNN/$cityName/$hour:00:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return (response?.data as List)
        .map((x) => PredictAirQuality.fromJson(x))
        .toList();
  }

  Future<List<PredictAirQuality>> getGRUPredictAqiHourly(String hour, String cityName) async {
    Response? response;
    try {
      response = await Dio().get(
          'http://14.225.255.164:7899/v1/Forecast/GRU/$cityName/$hour:00:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return (response?.data as List)
        .map((x) => PredictAirQuality.fromJson(x))
        .toList();
  }
}
