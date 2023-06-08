import 'package:get/get.dart';

import '../../../common/base/base_view_model.dart';
import '../../../data/model/destination.dart';
import 'google_map/google_map.dart';

class DetailDestinationViewModel extends BaseViewModel<Destination> {
  late bool isFavourite = false;

  @override
  Future<Destination?> initialData() async {
    return await Get.arguments;
  }

  void getToMap() {
    Get.toNamed(Get.currentRoute + GoogleMapPage.routePath, arguments: state);
  }
}
