import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/user.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/dialog/default_dialog.dart';

import '../repository/auth_repository.dart';
import '../repository/user_repository.dart';
import 'email_verification/email_verification_page.dart';

class RegisterViewModel extends GetxController with StateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserRepostiory _userRepo = Get.find<UserRepostiory>();
  final AuthRepostiory _authRepo = Get.find<AuthRepostiory>();

  String phoneNumber = '';
  String fullName = '';
  String age = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool checkEmail = true;

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

  String? validPhoneNumber(String? value) {
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

  String? validConfirmPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorConfirmPasswordEmpty;
      } else if (!RegExp(r'^[A-Za-z\d!@#$%^&*-+\=]+$').hasMatch(value) ||
          value.contains(' ')) {
        return L10n.current.errorFormatPassword;
      } else if (value.length < 8) {
        return L10n.current.errorMinLengthPassword;
      } else if (value.length > 32) {
        return L10n.current.errorMaxLengthPassword;
      }
      if (value != password) {
        return L10n.current.errorConfirmPassword;
      }
    }
    return null;
  }

  Future<void> onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      try {
        await _authRepo.createUserWithEmailAndPassword(email, password);
        final userModel = UserModel(
            id: FirebaseAuth.instance.currentUser!.uid,
            phoneNumber: phoneNumber,
            fullName: fullName,
            age: int.parse(age),
            email: email);

        await _userRepo.createNewUser(userModel);

        Get.toNamed(Get.currentRoute + EmailVerificationPage.routePath);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Get.showDefaultDialog(DefaultDialog.alert(
              content: Text(L10n.current.errorAccountExisted)));
        }
      }
    }
  }
}
