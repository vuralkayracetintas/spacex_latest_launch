// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_latest_launch/bloc/spacex_bloc.dart';
import 'package:spacex_latest_launch/bloc/spacex_events.dart';
import 'package:spacex_latest_launch/bloc/spacex_states.dart';
import 'package:spacex_latest_launch/feature/home/home_page.dart';
import 'package:spacex_latest_launch/feature/widgets/custom_circle_progress.dart';
import 'package:spacex_latest_launch/product/constans/string_constans.dart';
import 'package:spacex_latest_launch/product/repository/spacex_repositorty.dart';

int index = 0;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SpacexBloc(
        RepositoryProvider.of<SpacexRepository>(context),
      )..add(LoadSpacexData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringConstans.appBarTitle),
        ),
        body: BlocBuilder<SpacexBloc, SpacexStates>(
          builder: (BuildContext context, state) {
            debugPrint('state: ${state.runtimeType}');

            if (state is SpacexInitialState || state is SpacexLoadingState) {
              const CustomCircleProgress();
            } else if (state is SpacexErrorState) {
              debugPrint('error : ${state.message}');
              return Text('Getting Error: ${state.message}');
            } else if (state is SpacexLoadedState) {
              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<SpacexBloc>(context).add(LoadSpacexData());
                  },
                  //_refresh,
                  child: HomePage(
                    size: size,
                    state: state,
                    index: index,
                  ));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
