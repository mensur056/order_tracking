import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order_app/core/data/model/responses/detail/order_model.dart';
import 'package:order_app/core/data/model/responses/home/last_project_model.dart';
import 'package:order_app/core/data/model/responses/home/project_model.dart';
import 'package:order_app/utility/constants/firebase/firebase_collections.dart';

class HomeDataSource {
  Future<List<ProjectModel>?> fetchAllProject() async {
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

  Future<List<LastProjectModel>?> fetchAllLastProject() async {
    CollectionReference lastProject = FirebaseCollection.lastProjects.referance;
    final response = await lastProject.withConverter(
      fromFirestore: (snapshot, options) {
        return LastProjectModel.fromJson(snapshot.data()!);
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

  Future<List<OrderModel>?> fetchAllOrder() async {
    CollectionReference orders = FirebaseCollection.orders.referance;

    final response = await orders.withConverter(
      fromFirestore: (snapshot, options) {
        return OrderModel.fromJson(snapshot.data()!);
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
