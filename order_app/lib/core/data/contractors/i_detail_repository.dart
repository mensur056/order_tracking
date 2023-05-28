import 'package:multiple_result/multiple_result.dart';

import '../../../feature/global/failure/home_failure.dart';
import '../model/responses/detail/order_model.dart';

abstract class IDetailRepository {
  Future<Result<List<OrderModel>, HomeFailureDialog>> fetchOrder();
}
