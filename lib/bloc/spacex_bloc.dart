// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spacex_latest_launch/product/blocs/spacex_events.dart';
// import 'package:spacex_latest_launch/product/blocs/spacex_states.dart';
// import 'package:spacex_latest_launch/product/repository/spacex_repository.dart';

// class SpacexBloc extends Bloc<SpacexEvents, SpacexStates> {
//   SpacexBloc(SpacexStates initialState) : super(initialState);

//   @override
//   Stream<SpacexStates> mapEventToState(SpacexEvents event) async* {
//     if (event is LoadSpacexData) {
//       yield SpacexLoadingState();
//       try {
//         var data = await SpacexRepository().getData();
//         yield SpacexLoadingState();
//       } catch (e) {
//         yield SpacexErrorState(e.toString());
//       }
//     }
//   }
// }

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
