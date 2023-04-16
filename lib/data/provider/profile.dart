import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider {

  ProfileProvider(
      {this.prefs,
      this.firebaseStorage,
      this.firebaseFirestore});
  final SharedPreferences? prefs;
  final FirebaseFirestore? firebaseFirestore;
  final FirebaseStorage? firebaseStorage;

  String? getPrefs(String key) {
    return prefs?.getString(key);
  }

  Future<Future<bool>?> setPrefs(String key, String value) async {
    return prefs?.setString(key, value);
  }

  UploadTask? uploadImageFile(File image, String fileName) {
    final Reference? reference = firebaseStorage?.ref().child(fileName);
    final UploadTask? uploadTask = reference?.putFile(image);
    return uploadTask;
  }

  Future<void>? updateFirestoreData(String collectionPath, String path,
      Map<String, dynamic> dataUpdateNeeded) {
    return firebaseFirestore
        ?.collection(collectionPath)
        .doc(path)
        .update(dataUpdateNeeded);
  }
}
