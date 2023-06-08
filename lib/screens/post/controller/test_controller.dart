import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../common/extension/extenstion.dart';
import '../../../data/model/user.dart';
import '../../authentication/repository/post_repository.dart';
import '../../authentication/repository/user_repository.dart';
import '../../home/home_view_model.dart';
import '../post_page_view_model.dart';

class TestController extends GetxController {
  XFile? imagePost;

  Future<void> handleChooseFromGallery() async {
    final XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    changeImagePost(imageFile);
  }

  void changeImagePost(XFile? value) {
    imagePost = value;
    refresh();
  }
}
