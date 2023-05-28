import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollection {
  projects,
  lastProjects,
  category;

  CollectionReference get referance => FirebaseFirestore.instance.collection(name);
}
