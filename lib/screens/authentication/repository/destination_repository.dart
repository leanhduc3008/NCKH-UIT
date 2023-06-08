import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../common/constants/collections.dart';
import '../../../data/model/destination.dart';

class DestinationRepository extends GetxController {
  final destinations =
      FirebaseFirestore.instance.collection(Collections.destinations);

  Future<List<Destination?>> getListDestination() async {
    final datas = await destinations
        .withConverter<Destination>(
            fromFirestore: (snapshot, _) =>
                Destination.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson())
        .get();
    return datas.docs.map((doc) => doc.data()).toList();
  }
}
