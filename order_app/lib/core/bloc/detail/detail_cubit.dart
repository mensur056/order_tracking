import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/data/model/responses/detail/order_model.dart';

import '../../data/contractors/i_detail_repository.dart';

part 'detail_state.dart';

class DetailOrderCubit extends Cubit<DetailOrderState> {
  DetailOrderCubit(this._detailRepository) : super(DetailOrderInitial());
  final IDetailRepository _detailRepository;

  Future<void> fetchOrders() async {
    emit(DetailOrderInProgress());
    final result = await _detailRepository.fetchOrder();
    if (result.isSuccess()) {
      final detailResult = result.tryGetSuccess();
      emit(DetailOrderSuccess(items: detailResult!));
    } else if (result.isError()) {
      emit(DetailOrderFailure());
    }
  }
}
