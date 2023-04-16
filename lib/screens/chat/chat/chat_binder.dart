import 'package:get/get.dart';

import '../../../data/provider/chat.dart';


class HomeBinder extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ChatViewmodel>(() => ChatViewmodel());
    Get.lazyPut<ChatProvider>(() => ChatProvider());
  }
}