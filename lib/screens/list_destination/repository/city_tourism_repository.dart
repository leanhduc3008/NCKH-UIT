import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../common/constants/collections.dart';
import '../model/city_tourism.dart';

class CityTourismRepository extends GetxController {
  final cityTourism =
      FirebaseFirestore.instance.collection(Collections.cityTourism);

  Future<List<CityTourism>> getListCities() async {
    final datas = await cityTourism
        .withConverter<CityTourism>(
            fromFirestore: (snapshot, _) =>
                CityTourism.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson())
        .get();
    return datas.docs.map((doc) => doc.data()).toList();
  }
}
