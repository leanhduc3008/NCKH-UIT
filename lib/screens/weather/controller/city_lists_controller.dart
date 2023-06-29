import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/base/base_view_model.dart';
import '../model/weather.dart';
import '../repository/weather_repository.dart';

class CityListsController extends BaseViewModel<List<Weather>> {
  final WeatherRepository _weatherRepo = Get.find<WeatherRepository>();
  List<Weather> listResult = [];
  RxBool loading = false.obs;
  List<String> cityLists = [
    'Ho Chi Minh City',
    'Ha Noi',
    'Da Nang',
    'Vung Tau',
    'Sa Pa',
    'Thua Thien Hue',
    'Nha Trang',
    'Phu Quoc',
    'Ha Long',
    'DaLat'
  ];
  List<Weather> listWeather = [];

  @override
  Future<List<Weather>?> initialData() async {
    listWeather = await _weatherRepo.getListCityWeather(cityLists);
    return listWeather;
  }

  Future<void> deleteCity(String cityName) async {
    cityLists.remove(cityName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('city', cityLists);
  }

  Future<Weather> loadCity(String cityName) async {
    return _weatherRepo.getCiyWeather(cityName);
  }

  @override
  void onClose() {
    super.dispose();
  }
}
