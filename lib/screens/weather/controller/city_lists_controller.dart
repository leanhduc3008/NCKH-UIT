import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/base/base_view_model.dart';
import '../../../data/provider/city_provider.dart';
import '../model/weather.dart';
import '../repository/weather_repository.dart';

class CityListsController extends BaseViewModel<List<Weather>> {
  final WeatherRepository _weatherRepo = Get.find<WeatherRepository>();
  final CityProvider _cityProvider = Get.find<CityProvider>();
  List<Weather> listResult = [];
  RxBool loading = false.obs;
  List<String> cityLists = [];

  @override
  Future<List<Weather>> initialData() async {
    return _weatherRepo.getListCityWeather(_cityProvider.getListCity());
  }

  Future<void> addCity(String cityName) async {
    final List<Weather> list = listResult;
    cityLists.add(cityName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('city', cityLists);
    final weather = await _weatherRepo.getCiyWeather(cityName);
    list.add(weather);
    listResult = list;
  }

  Future<void> deleteCity(String cityName) async {
    cityLists.remove(cityName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('city', cityLists);
  }

  Future<Weather> loadCity(String cityName) async {
    return _weatherRepo.getCiyWeather(cityName);
  }
}
