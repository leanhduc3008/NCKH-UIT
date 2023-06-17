import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../../common/constants/theme.dart';
import '../model/air_quality.dart';
import '../model/predict_air_quality.dart';

class AirQualityRepository {
  Future<AirQuality> getAqiHourly(
      String cityName, String date, String hour) async {
    Response? response;
    try {
      response = await Dio()
          .get('http://14.225.255.164:7123/v1/$cityName/$date%20$hour:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return AirQuality.fromJson(response?.data);
  }

  Future<List<PredictAirQuality>> getDeepQLPredictAqiHourly(String hour) async {
    Response? response;
    try {
      response = await Dio().get(
          'http://14.225.255.164:7123/v1/Forecast/DeepQLearning/HoChiMinh/$hour:00:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return (response?.data as List)
        .map((x) => PredictAirQuality.fromJson(x))
        .toList();
  }

  Future<List<PredictAirQuality>> getArimaPredictAqiHourly(String hour) async {
    Response? response;
    try {
      response = await Dio().get(
          'http://14.225.255.164:7123/v1/Forecast/ARIMA/HoChiMinh/$hour:00:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return (response?.data as List)
        .map((x) => PredictAirQuality.fromJson(x))
        .toList();
  }

  Future<List<PredictAirQuality>> getRNNPredictAqiHourly(String hour) async {
    Response? response;
    try {
      response = await Dio().get(
          'http://14.225.255.164:7123/v1/Forecast/RNN/HoChiMinh/$hour:00:00');
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
    return (response?.data as List)
        .map((x) => PredictAirQuality.fromJson(x))
        .toList();
  }
}
