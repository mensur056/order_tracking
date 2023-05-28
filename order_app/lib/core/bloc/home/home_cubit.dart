import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/data/contractors/i_home_repository.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeInitial());

  final IHomeRepository _homeRepository;

  Future<void> fetchProjects() async {
    emit(HomeInProgress());
    final projectResult = await _homeRepository.fetchProjects();
    final lastProjectResult = await _homeRepository.fetchLastProjects();

    if (projectResult.isSuccess() && lastProjectResult.isSuccess()) {
      final homeProjectsResult = projectResult.tryGetSuccess();
      final homeLastProjectResult = lastProjectResult.tryGetSuccess();
      emit(HomeSucces(items: homeProjectsResult, lastItems: homeLastProjectResult));
    } else if (projectResult.isError() && lastProjectResult.isError()) {
      emit(HomeFailure());
    }
  }
}
