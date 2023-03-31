import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../allconst/all_const.dart';

class ChatUser extends Equatable {
  final String id;
  final String photoUrl;
  final String displayName;
  final String phoneNumber;
  final String aboutMe;
  final String email;

  const ChatUser(
      {required this.id,
      required this.photoUrl,
      required this.displayName,
      required this.phoneNumber,
      required this.aboutMe,
      required this.email});

  ChatUser copyWith({
    String? id,
    String? photoUrl,
    String? nickname,
    String? phoneNumber,
    String? email,
  }) =>
      ChatUser(
          id: id ?? this.id,
          photoUrl: photoUrl ?? this.photoUrl,
          displayName: nickname ?? displayName,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          aboutMe: email ?? aboutMe,
          email: email ?? this.email);

  Map<String, dynamic> toJson() => {
        FirestoreConstants.displayName: displayName,
        FirestoreConstants.photoUrl: photoUrl,
        FirestoreConstants.phoneNumber: phoneNumber,
        FirestoreConstants.aboutMe: aboutMe,
        FirestoreConstants.email: email,
      };
  factory ChatUser.fromDocument(DocumentSnapshot snapshot) {
    String photoUrl = "";
    String nickname = "";
    String phoneNumber = "";
    String aboutMe = "";
    String email = "";

    try {
      photoUrl = snapshot.get(FirestoreConstants.photoUrl);
      nickname = snapshot.get(FirestoreConstants.displayName);
      phoneNumber = snapshot.get(FirestoreConstants.phoneNumber);
      aboutMe = snapshot.get(FirestoreConstants.aboutMe);
      email = snapshot.get(FirestoreConstants.email);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return ChatUser(
        id: snapshot.id,
        photoUrl: photoUrl,
        displayName: nickname,
        phoneNumber: phoneNumber,
        aboutMe: aboutMe,
        email: email);
  }
  List<Object?> get props => [id, photoUrl, displayName, phoneNumber, aboutMe, email];
}