import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex_latest_launch/product/constans/string_constans.dart';

class CustomCircleProgress extends StatelessWidget {
  const CustomCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(StringConstans.lottieSatellite),
    );
  }
}
