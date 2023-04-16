import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../../../common/base/base_view_model.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/provider/auth_provider.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/dialog/default_dialog.dart';
import '../../home/home_page.dart';
import '../register/register_page.dart';
import '../repository/auth_repository.dart';

class LoginViewModel extends BaseViewModel<UserModel> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepostiory _authRepo = Get.find<AuthRepostiory>();
  final AuthProvider _provider = Get.find<AuthProvider>();

  String email = '';
  String password = '';

  @override
  Future<UserModel?> initialData() async {
    return _provider.user;
  }

  @override
  void onReady() {
    if (Get.arguments is String) {
      Get.defaultDialog(title: Get.arguments);
    }
    super.onReady();
    addListener(() {
      if (state != null) {
        HomePage.goToPage();
      } else {
        FlutterNativeSplash.remove();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    FlutterNativeSplash.remove();
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

  String? validPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorPasswordEmpty;
      } else if (!RegExp(r'^[A-Za-z\d!@#$%^&*-+\=]+$').hasMatch(value) ||
          value.contains(' ')) {
        return L10n.current.errorFormatPassword;
      } else if (value.length < 8) {
        return L10n.current.errorMinLengthPassword;
      } else if (value.length > 32) {
        return L10n.current.errorMaxLengthPassword;
      }
    }
    return null;
  }

  void toRegisterPage() {
    Get.toNamed(Get.currentRoute + RegisterPage.routePath);
  }

  Future<void> onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      try {
        final UserCredential? userCredential =
            await _authRepo.signInWithEmailAndPassword(email, password);
        final UserModel user =
            UserModel(email: userCredential?.user!.email ?? '');
        await _provider.saveUser(user);
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          change(user);
        } else {
          _provider.logout();
          Get.showDefaultDialog(DefaultDialog.alert(
              content: Text(L10n.current.pleaseConfirmEmail)));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.showDefaultDialog(DefaultDialog.alert(
              content: Text(L10n.current.errorAccountNotRegisted)));
        }
        if (e.code == 'wrong-password') {
          Get.showDefaultDialog(
              DefaultDialog.alert(content: Text(L10n.current.wrong_password)));
        }
      }
    }
  }
}
