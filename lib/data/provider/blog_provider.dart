import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../widgets/dialog/default_dialog.dart';

class CrudMethods {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection('blogs')
        .add(blogData)
        .catchError((e) =>
      Get.dialog(DefaultDialog.alert(
        content: e,
      ))
    );
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getData() async {
    return FirebaseFirestore.instance.collection('blogs').snapshots();
  }
}
