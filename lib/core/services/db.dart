import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  getUserByUsername(String email) async {
    return await firestore
        .collection("users")
        .where('name', isEqualTo: email)
        .get();
  }

  uploadDocuments(userMap) {
    firestore.collection("users").add(userMap);
  }

  createChatroom(String chatroomID, chatroomMap) {
    firestore.collection('chatroom').doc(chatroomID).set(chatroomMap);
  }
}
