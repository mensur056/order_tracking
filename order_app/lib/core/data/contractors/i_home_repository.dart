import 'package:multiple_result/multiple_result.dart';
import 'package:order_app/core/data/model/responses/project_model.dart';
import 'package:order_app/feature/global/home_failure.dart';

abstract class IHomeRepository {
  Future<Result<List<ProjectModel>, HomeFailure>> fetcProjects();
}
