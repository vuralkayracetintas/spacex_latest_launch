import 'package:equatable/equatable.dart';

abstract class SpacexEvents extends Equatable {
  const SpacexEvents();
}

class LoadSpacexData extends SpacexEvents {
  @override
  List<Object?> get props => [];
}
