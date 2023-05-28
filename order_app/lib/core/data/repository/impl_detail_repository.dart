import 'package:multiple_result/multiple_result.dart';
import 'package:order_app/core/data/contractors/i_detail_repository.dart';

import '../../../feature/global/failure/home_failure.dart';
import '../../locator/locator.dart';
import '../data_source/home_data_source.dart';
import '../model/responses/detail/order_model.dart';

class ImplDetailRepository implements IDetailRepository {
  final homeDataSource = getIt.get<HomeDataSource>();

  @override
  Future<Result<List<OrderModel>, HomeFailureDialog>> fetchOrder() async {
    try {
      final result = await homeDataSource.fetchAllOrder();
      return Success(result!);
    } catch (e) {
      return Error(HomeFailureDialog());
    }
  }
}
