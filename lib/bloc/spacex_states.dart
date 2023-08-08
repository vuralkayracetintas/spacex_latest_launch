import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/product/models/spacex_model.dart';

@immutable
abstract class SpacexStates extends Equatable {
  const SpacexStates();
}

class SpacexInitialState extends SpacexStates {
  @override
  List<Object?> get props => [];
}

//data loading
class SpacexLoadingState extends SpacexStates {
  @override
  List<Object?> get props => [];
}

//data loaded

class SpacexLoadedState extends SpacexStates {
  final SpacexModel spacexModel;

  const SpacexLoadedState(this.spacexModel);

  @override
  List<Object?> get props => [spacexModel];
}

class SpacexErrorState extends SpacexStates {
  const SpacexErrorState(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}


//data error
