import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../common/constants/collections.dart';
import '../../../common/constants/theme.dart';
import '../../../data/model/user.dart';

class UserRepostiory extends GetxController {
  static UserRepostiory get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createNewUser(UserModel user) async {
    try {
      await _db.collection(Collections.users).add(user.toJson());
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
  }
}