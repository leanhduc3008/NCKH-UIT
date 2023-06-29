import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/base/base_view_model.dart';
import '../model/predict_air_quality.dart';
import '../repository/air_quality_repo.dart';

class PredictAirController extends BaseViewModel<List<PredictAirQuality>> {
  final AirQualityRepository _repo = Get.find<AirQualityRepository>();
  String cityName = 'HoChiMinh';
  RxBool isDeepQLearning = true.obs;
  RxBool isLSTM = false.obs;
  RxBool isRNN = false.obs;
  RxBool isGRU = false.obs;
  RxBool isLoading = false.obs;
  RxList<PredictAirQuality> lstPredict = RxList();

  @override
  Future<List<PredictAirQuality>?> initialData() async {
    lstPredict.value = await _repo
        .getDeepQLPredictAqiHourly(DateFormat('H').format(DateTime.now()), cityName);
    return lstPredict;
  }

  Future<void> getDeepQLPredict(String cityName) async {
    isLoading.value = true;
    lstPredict.value = await _repo
        .getDeepQLPredictAqiHourly(DateFormat('H').format(DateTime.now()), cityName);
    isLoading.value = false;
  }

  Future<void> getLSTMPredict(String cityName) async {
    isLoading.value = true;
    lstPredict.value = await _repo
        .getLSTMPredictAqiHourly(DateFormat('H').format(DateTime.now()), cityName);
    isLoading.value = false;
  }

  Future<void> getRNNPredict(String cityName) async {
    isLoading.value = true;
    lstPredict.value = await _repo
        .getRNNPredictAqiHourly(DateFormat('H').format(DateTime.now()), cityName);
    isLoading.value = false;
  }

   Future<void> getGRUPredict(String cityName) async {
    isLoading.value = true;
    lstPredict.value = await _repo
        .getGRUPredictAqiHourly(DateFormat('H').format(DateTime.now()), cityName);
    isLoading.value = false;
  }
}
