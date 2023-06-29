import 'package:get/get.dart';

import '../../authentication/repository/destination_repository.dart';
import 'list_destination_view_model.dart';

class ListDestinationBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListDestinationViewModel());
    Get.lazyPut(() => DestinationRepository());
  }
}
