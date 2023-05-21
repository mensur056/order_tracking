import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order_app/core/data/model/responses/project_model.dart';
import 'package:order_app/utility/constants/firebase/firebase_collections.dart';

class HomeDataSource {
  Future<List<ProjectModel>?> fetcProject() async {
    CollectionReference project = FirebaseCollection.projects.referance;
    final response = await project.withConverter(
      fromFirestore: (snapshot, options) {
        return ProjectModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }
}