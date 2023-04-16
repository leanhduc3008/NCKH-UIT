import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/collections.dart';
import '../../../data/model/user.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../widgets/widget.dart';

class UserRepostiory extends GetxController {
  final users = FirebaseFirestore.instance.collection(Collections.users);

  Future<void> createNewUser(UserModel user) async {
    await users.add(user.toJson());
  }

  Future<UserModel?> getUser(String id) async {
    final datas = await users
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson())
        .where('id', isEqualTo: id)
        .get();
    return datas.docs.first.data();
  }

  Future<String?> getDocId(String userId) async {
    late String docId;
    await users
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson())
        .where('id', isEqualTo: userId)
        .get()
        .then((value) {
      for (final element in value.docs) {
        docId = element.id;
      }
    });
    return docId;
  }

  Future<void> updateUser(
      String id, String username, String fullName, String position) async {
    await users
        .doc(id)
        .update(
            {'username': username, 'fullName': fullName, 'position': position})
        .then((_) => Get.showDefaultDialog(DefaultDialog.success(
            content: Text(L10n.current.updateSuccessfully))))
        .catchError((_) => Get.showDefaultDialog(
            DefaultDialog.alert(content: Text(L10n.current.updateFailed))));
  }
}
