import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../allconst/all_const.dart';
import '../../models/chat_messages.dart';

class ChatProvider {
  ChatProvider(
      {this.firebaseStorage,  this.firebaseFirestore});
  final FirebaseFirestore? firebaseFirestore;
  final FirebaseStorage? firebaseStorage;

  UploadTask? uploadImageFile(File image, String filename) {
    final Reference? reference = firebaseStorage?.ref().child(filename);
    final UploadTask? uploadTask = reference?.putFile(image);
    return uploadTask;
  }

  Future<void>? updateFirestoreData(
      String collectionPath, String docPath, Map<String, dynamic> dataUpdate) {
    return firebaseFirestore
        ?.collection(collectionPath)
        .doc(docPath)
        .update(dataUpdate);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getChatMessage(String groupChatId, int limit) {
    return firebaseFirestore
        ?.collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  void sendChatMessage(String content, int type, String groupChatId,
      String currentUserId, String peerId) {
    final DocumentReference<Map<String, dynamic>>? documentReference = firebaseFirestore
        ?.collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());
    final ChatMessages chatMessages = ChatMessages(
        idFrom: currentUserId,
        idTo: peerId,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        content: content,
        type: type);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference!, chatMessages.toJson());
    });
  }
}

class MessageType {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
}
