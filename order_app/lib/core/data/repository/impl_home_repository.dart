import 'package:multiple_result/multiple_result.dart';
import 'package:order_app/core/data/contractors/i_home_repository.dart';
import 'package:order_app/core/data/data_source/home_data_source.dart';
import 'package:order_app/core/data/model/responses/home/last_project_model.dart';
import 'package:order_app/core/data/model/responses/home/project_model.dart';
import 'package:order_app/core/locator/locator.dart';
import 'package:order_app/feature/global/failure/home_failure.dart';

class ImplHomeRepository implements IHomeRepository {
  final homeDataSource = getIt.get<HomeDataSource>();

  @override
  Future<Result<List<ProjectModel>, HomeFailureDialog>> fetchProjects() async {
    try {
      final result = await homeDataSource.fetchAllProject();
      return Success(result!);
    } catch (e) {
      return Error(HomeFailureDialog());
    }
  }

  @override
  Future<Result<List<LastProjectModel>, HomeFailureDialog>> fetchLastProjects() async {
    try {
      final result = await homeDataSource.fetchAllLastProject();
      return Success(result!);
    } catch (e) {
      return Error(HomeFailureDialog());
    }
  }
}
