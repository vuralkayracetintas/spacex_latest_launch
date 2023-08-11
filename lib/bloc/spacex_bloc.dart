import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_latest_launch/bloc/spacex_events.dart';
import 'package:spacex_latest_launch/bloc/spacex_states.dart';
import 'package:spacex_latest_launch/product/repository/spacex_repositorty.dart';

class SpacexBloc extends Bloc<SpacexEvents, SpacexStates> {
  final SpacexRepository _spacexRepository;
  SpacexBloc(this._spacexRepository) : super(SpacexLoadingState()) {
    on<LoadSpacexData>(
      (event, emit) async {
        emit(SpacexLoadingState());
        try {
          final spacexModel = await _spacexRepository.getLatestLaunch();
          emit(SpacexLoadedState(spacexModel));
        } catch (e) {
          emit(SpacexErrorState(e.toString()));
        }
      },
    );
  }
}
