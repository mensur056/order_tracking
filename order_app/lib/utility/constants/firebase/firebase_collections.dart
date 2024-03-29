import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollection {
  projects,
  orders,
  lastProjects;

  CollectionReference get referance => FirebaseFirestore.instance.collection(name);
}
