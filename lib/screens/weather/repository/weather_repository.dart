import 'package:dio/dio.dart';

import '../model/weather.dart';

class WeatherRepository {
  final List<Weather> listResult = [];
  Future<Weather> getCiyWeather(String cityName) async {
    final response = await Dio().get(
        'https://api.weatherapi.com/v1/forecast.json?key=a7fba5c7b4734eb180f142241231202&q=$cityName');
    return Weather.fromJSON(response.data);
  }

  Future<List<Weather>> getListCityWeather(List<String> cityNames) async {
    listResult.clear();
    for (final name in cityNames) {
      final weather = await getCiyWeather(name);
      listResult.add(weather);
    }
    return listResult;
  }
}
