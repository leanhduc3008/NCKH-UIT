import 'package:get/get.dart';
import '../../common/base/base_view_model.dart';
import 'city/city_lists.dart';
import 'model/weather.dart';
import 'repository/weather_repository.dart';

class WeatherViewModel extends BaseViewModel<Weather> {
  final WeatherRepository _weatherRepo = Get.find<WeatherRepository>();
  Weather? weather;
  String name = '';

  @override
  Future<Weather?> initialData() async {
    change(state, status: RxStatus.loading());
    if (name == '') {
      weather = await loadCity('Ho Chi Minh');
    } else {
      weather = await loadCity(name);
    }
    change(state, status: RxStatus.success());
    return weather;
  }

  Future<Weather> loadCity(String cityName) async {
    return _weatherRepo.getCiyWeather(cityName);
  }

  Future<void> goToCityListPage() async {
    name = await Get.to(() => const CityLists()) ?? '';
  }
}
