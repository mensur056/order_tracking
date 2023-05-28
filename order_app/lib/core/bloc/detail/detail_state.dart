part of 'detail_cubit.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailSuccess extends DetailState {
  final List<OrderModel> items;

  DetailSuccess({required this.items});
}

class DetailFailure extends DetailState {}

class DetailInProgress extends DetailState {}
