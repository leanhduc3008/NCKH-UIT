import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../l10n/generated/l10n.dart';
import '../../authentication/repository/user_repository.dart';
import '../profile_view_model.dart';

class UpdateProfileViewModel extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final userFB = FirebaseAuth.instance.currentUser;
  final ProfileViewModel _profileViewModel = Get.find();
  final UserRepostiory _userRepo = Get.find();

  late String phoneNumber, fullName, age, email, docId;

  @override
  Future<void> onInit() async {
    super.onInit();
    phoneNumber = _profileViewModel.state?.phoneNumber ?? '';
    fullName = _profileViewModel.state?.fullName ?? '';
    age = (_profileViewModel.state?.age).toString();
    email = _profileViewModel.state?.email ?? '';
    docId = await _userRepo.getDocId(userFB!.uid) ?? '';
  }

  String? validUsername(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorUserNameEmpty;
      }
    }
    return null;
  }

  String? validFullName(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorFullNameEmpty;
      }
    }
    return null;
  }

  String? validPosition(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorPositionEmpty;
      }
    }
    return null;
  }

  String? validEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorEmailEmpty;
      } else if (!value.endsWith('@gmail.com')) {
        return L10n.current.errorEmailFormat;
      }
    }
    return null;
  }

  Future<void> updateInfoUser() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      await _userRepo.updateUser(docId, phoneNumber, fullName, age);
      await _profileViewModel.onRefresh();
      Get.back();
    }
  }
}
