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
  static const String baseUrl = "https://api.spacexdata.com/v4/launches/latest";

  static const String failLoadData = "Failed to load data";

  static const String couldNotData = 'Could not launch';
  static const String lottieSatellite = 'assets/animations/satellite.json';

  static const String lottieSpacex = 'assets/animations/spacexA.json';
  static const String titleWiki = 'Wikipedia :';

  static const String buttonTextWiki = 'click to wikipedia';
  static const String titleYoutube = 'Youtube :';

  static const String buttonTextYoutube = 'click to watch on youtube';
  static const String titleReddit = 'Reddit :';

  static const String buttonTextReddit = 'click to details';
  static const String flightNumber = 'Flight Number: ';

  static const String date = 'Date : ';
  static const String spacemanImage = 'assets/images/spaceman.png';

  static const String errorLoadData = 'Error loading data';
  static const String detaildValueNot = "Detail Values Not Found";
}
