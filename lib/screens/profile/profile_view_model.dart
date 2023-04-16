import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../data/model/user.dart';
import '../../common/base/base_view_model.dart';
import '../../data/provider/auth_provider.dart';
import '../authentication/repository/user_repository.dart';
import 'update_profile/update_profile_page.dart';

class ProfileViewModel extends BaseViewModel<UserModel> {
  final userFB = FirebaseAuth.instance.currentUser;
  final _userRepo = Get.find<UserRepostiory>();
  final _provider = Get.find<AuthProvider>();

  @override
  Future<UserModel?> initialData() async {
    final UserModel? userModel = await _userRepo.getUser(userFB!.uid);
    if (userModel != null) {
      await _provider.saveUser(userModel);
    }
    return userModel;
  }

  Future<void> updateProfile() async {
    Get.toNamed(Get.currentRoute + UpdateProfilePage.routePath);
  }
}
