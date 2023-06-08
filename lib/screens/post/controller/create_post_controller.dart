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

class CreatePostController extends GetxController {
  Rxn<XFile> imagePost = Rxn();
  String url = '';
  String userName = '';
  final userFB = FirebaseAuth.instance.currentUser;
  TextEditingController locationController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  final Reference storageRef = FirebaseStorage.instance.ref();
  final PostRepository _postRepo = Get.find<PostRepository>();
  final _userRepo = Get.find<UserRepostiory>();
  final postPageVMD = Get.tryFind<PostPageViewModel>();
  final homeVMD = Get.tryFind<HomeViewModel>();
  LocationPermission? permission;

  @override
  Future<void> onInit() async {
    super.onInit();
    final UserModel? userModel = await _userRepo.getUser(userFB!.uid);
    userName = userModel?.fullName ?? '';
  }

  Future<void> handleTakePhoto() async {
    final XFile? imageFile = await picker.pickImage(source: ImageSource.camera);
    imagePost.value = imageFile;
  }

  Future<void> handleChooseFromGallery() async {
    final XFile? imageFile =
        await picker.pickImage(source: ImageSource.gallery);
    imagePost.value = imageFile;
  }

  Future<String> uploadImageToStorage(File file) async {
    final Reference ref = storageRef.child('Post_${file.path}');
    final UploadTask uploadTask = storageRef.child(file.path).putFile(file);
    uploadTask.whenComplete(() async {
      url = ref.getDownloadURL().toString();
      print(url);
    }).catchError((onError) {
      print(onError);
    });
    return url;
  }

  Future<void> handleSumit() async {
    final String mediaUrl =
        await uploadImageToStorage(File(imagePost.value!.path));
    await _postRepo.createPost(
        const Uuid().v4(),
        userName,
        DateFormat('MMMMd', 'vi').format(DateTime.now()),
        locationController.text,
        mediaUrl);
    if (postPageVMD != null && homeVMD != null) {
      imagePost.value = null;
      homeVMD?.tabController.animateTo(1);
      postPageVMD?.onRefresh();
      Get.back();
    }
  }

  Future<void> getCurrentLocation() async {
    permission = await Geolocator.requestPermission();
    final Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
    final Placemark place = placemarks[0];
    final String formattedLocation = '${place.locality}, ${place.country}';
    locationController.text = formattedLocation;
  }
}
