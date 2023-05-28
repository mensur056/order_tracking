import 'package:order_app/core/data/model/responses/home/last_project_model.dart';
import 'package:order_app/core/data/model/responses/home/project_model.dart';

abstract class HomeState {}

class HomeSucces extends HomeState {
  final List<ProjectModel>? items;
  final List<LastProjectModel>? lastItems;
  HomeSucces({
    this.items,
    this.lastItems,
  });
}

class HomeFailure extends HomeState {}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}
