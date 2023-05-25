import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/data/contractors/i_home_repository.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeInitial());

  final IHomeRepository _homeRepository;

  Future<void> fetchProjects() async {
    emit(HomeInProgress());
    final result = await _homeRepository.fetchProjects();
    if (result.isSuccess()) {
      final homeProjectsResult = result.tryGetSuccess();
      emit(HomeSucces(items: homeProjectsResult));
    } else if (result.isError()) {
      print('sgs');
      emit(HomeFailure());
    }
  }
}
