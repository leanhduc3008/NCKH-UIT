import 'package:cloud_firestore/cloud_firestore.dart';
import '../allconst/all_const.dart';

class ChatMessages {

  ChatMessages(
      {required this.idFrom,
      required this.idTo,
      required this.timestamp,
      required this.content,
      required this.type});

  factory ChatMessages.fromDocument(DocumentSnapshot documentSnapshot) {
    final String idFrom = documentSnapshot.get(FirestoreConstants.idFrom);
    final String idTo = documentSnapshot.get(FirestoreConstants.idTo);
    final String timestamp = documentSnapshot.get(FirestoreConstants.timestamp);
    final String content = documentSnapshot.get(FirestoreConstants.content);
    final int type = documentSnapshot.get(FirestoreConstants.type);

    return ChatMessages(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type);
  }
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.idFrom: idFrom,
      FirestoreConstants.idTo: idTo,
      FirestoreConstants.timestamp: timestamp,
      FirestoreConstants.content: content,
      FirestoreConstants.type: type,
    };
  }
}
