import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex_latest_launch/feature/home/home_view.dart';
import 'package:spacex_latest_launch/product/constans/string_constans.dart';
import 'package:spacex_latest_launch/product/repository/spacex_repositorty.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), () {});

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => RepositoryProvider(
                  create: (context) => SpacexRepository(),
                  child: const HomeView(),
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              StringConstans.lottieSpacex,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
