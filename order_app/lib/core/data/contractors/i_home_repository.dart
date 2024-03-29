import 'package:multiple_result/multiple_result.dart';
import 'package:order_app/core/data/model/responses/home/last_project_model.dart';
import 'package:order_app/core/data/model/responses/home/project_model.dart';
import 'package:order_app/feature/global/failure/home_failure.dart';

abstract class IHomeRepository {
  Future<Result<List<ProjectModel>, HomeFailureDialog>> fetchProjects();
  Future<Result<List<LastProjectModel>, HomeFailureDialog>> fetchLastProjects();
}
