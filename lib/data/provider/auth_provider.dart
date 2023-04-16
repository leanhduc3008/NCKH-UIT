import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../common/constants/collections.dart';
import '../database/no_sql_storage.dart';
import '../model/user.dart';

abstract class AuthProvider {
  Future<void> logout();

  UserModel? get user;
  Future<void> saveUser(UserModel value);

  Future<String?> getPasswordIMAP();
  Future<bool> savePasswordIMAP(String value);
}

enum _AuthKey {
  user,
  passwordIMAP,
}

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCanceled,
}

class AuthProviderImpl extends GetxService implements AuthProvider {
  AuthProviderImpl() : super();
  final NoSqlStorage _storage = Get.find<NoSqlStorage>();
  final collection = FirebaseFirestore.instance.collection(Collections.users);

  @override
  Future<void> logout() async {
    _storage.clearEncrypted();
    _storage.clear();
    FirebaseFirestore.instance.clearPersistence();
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<String?> getPasswordIMAP() {
    return _storage.getEncrypted(_AuthKey.passwordIMAP.toString());
  }

  @override
  Future<bool> savePasswordIMAP(String value) {
    return _storage.saveEncrypted(_AuthKey.passwordIMAP.toString(), value);
  }

  @override
  UserModel? get user {
    try {
      final json = _storage.getItem(_AuthKey.user.toString());
      return UserModel.fromJson(json!);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveUser(UserModel value) async {
    await _storage.saveItem(
      _AuthKey.user.toString(),
      value.toJson(),
    );
    // collection.doc(value.id).update(value.toJson());
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   if (user != null) {
  //     _streamSubscription = collection
  //         .withConverter<User>(
  //           fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
  //           toFirestore: (value, _) => value.toJson(),
  //         )
  //         .doc(user?.id)
  //         .snapshots()
  //         .listen((event) => saveUser(event.data()!));
  //   }
  // }

  // @override
  // void onClose() {
  //   _streamSubscription?.cancel();
  //   super.onClose();
  // }
}
