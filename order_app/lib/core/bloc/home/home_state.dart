import 'package:order_app/core/data/model/responses/home/project_model.dart';

abstract class HomeState {}

class HomeSucces extends HomeState {
  final List<ProjectModel>? items;
  HomeSucces({required this.items});
}

class HomeFailure extends HomeState {}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}
