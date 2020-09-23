import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  getUserByUsername(String username) async {
    return await firestore
        .collection("users")
        .where('name', isEqualTo: username)
        .get();
  }

  getUserbyE(String email) async {
    return await firestore
        .collection("users")
        .where('email', isEqualTo: email)
        .get();
  }

  uploadDocuments(userMap) {
    firestore.collection("users").add(userMap);
  }

  createChatroom(String chatroomID, chatroomMap) {
    firestore.collection('chatroom').doc(chatroomID).set(chatroomMap);
  }
}
