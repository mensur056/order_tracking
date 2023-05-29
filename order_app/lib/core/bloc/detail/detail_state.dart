part of 'detail_cubit.dart';

abstract class DetailOrderState {}

class DetailOrderInitial extends DetailOrderState {}

class DetailOrderSuccess extends DetailOrderState {
  final List<OrderModel> items;

  DetailOrderSuccess({required this.items});
}

class DetailOrderFailure extends DetailOrderState {}

class DetailOrderInProgress extends DetailOrderState {}
