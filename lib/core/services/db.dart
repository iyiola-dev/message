import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  getUserByUsername(String email) {}

  uploadDocuments(userMap) {
    firestore.collection("users").add(userMap);
  }
}
