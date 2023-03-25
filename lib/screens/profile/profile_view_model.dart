import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../data/model/user.dart';
import '../../../common/constants/collections.dart';
import '../../common/base/base_view_model.dart';


class ProfileViewModel extends BaseViewModel<UserModel> {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  @override
  Future<UserModel?> initialData() async {
    final usersFireStore = await _db
        .collection(Collections.users)
        .where('email', isEqualTo: _auth.currentUser?.email)
        .get();
    final UserModel userModel = UserModel(
        age: usersFireStore.docs.first.data()['age'],
        email: usersFireStore.docs.first.data()['email'],
        fullName: usersFireStore.docs.first.data()['fullName'],
        phoneNumber: usersFireStore.docs.first.data()['phoneNumber']);
    return userModel;
  }
}
