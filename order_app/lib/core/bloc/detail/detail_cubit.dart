import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/data/model/responses/detail/order_model.dart';

import '../../data/contractors/i_detail_repository.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this._detailRepository) : super(DetailInitial());
  final IDetailRepository _detailRepository;

  Future<void> fetchOrders() async {
    emit(DetailInProgress());
    final result = await _detailRepository.fetchOrder();
    if (result.isSuccess()) {
      final detailResult = result.tryGetSuccess();
      emit(DetailSuccess(items: detailResult!));
    } else if (result.isError()) {
      emit(DetailFailure());
    }
  }
}
