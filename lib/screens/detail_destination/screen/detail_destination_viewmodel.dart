import 'package:get/get.dart';

import '../../../common/base/base_view_model.dart';
import '../../../data/model/destination.dart';

class DetailDestinationViewModel extends BaseViewModel<Destination> {
  @override
  Future<Destination?> initialData() async {
    return Get.arguments;
  }
}
