import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepostiory extends GetxController {
  static AuthRepostiory get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  UserCredential? userCredential;

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return userCredential;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
