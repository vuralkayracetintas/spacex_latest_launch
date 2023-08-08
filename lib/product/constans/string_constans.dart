import 'package:flutter/material.dart';

@immutable
class StringConstans {
  const StringConstans._();

  static const String spacexUrl =
      'https://api.spacexdata.com/v4/launches/latest';

  static const String appBarTitle = 'SpaceX Latest Launch';
  static const String refleshError = 'Error while refreshing: ';
  static const String refleshed = 'Refreshed';

  static const String crewMember = 'Crew Member';
}
