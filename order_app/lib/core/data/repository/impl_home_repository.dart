import 'package:multiple_result/multiple_result.dart';
import 'package:order_app/core/data/contractors/i_home_repository.dart';
import 'package:order_app/core/data/data_source/home_data_source.dart';
import 'package:order_app/core/data/model/responses/project_model.dart';
import 'package:order_app/core/locator/locator.dart';
import 'package:order_app/feature/global/home_failure.dart';

class ImplHomeRepository implements IHomeRepository {
  final homeDataSource = getIt.get<HomeDataSource>();

  @override
  Future<Result<List<ProjectModel>, HomeFailure>> fetcProjects() async {
    try {
      final result = await homeDataSource.fetcProject();
      return Success(result!);
    } catch (e) {
      return Error(HomeFailure());
    }
  }
}
