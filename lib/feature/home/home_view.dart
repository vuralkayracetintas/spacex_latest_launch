import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_latest_launch/bloc/spacex_bloc.dart';
import 'package:spacex_latest_launch/bloc/spacex_events.dart';
import 'package:spacex_latest_launch/bloc/spacex_states.dart';
import 'package:spacex_latest_launch/product/repository/spacex_repositorty.dart';

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
          title: const Text('SpaceX Latest Launch'),
        ),
        body: BlocBuilder<SpacexBloc, SpacexStates>(
          builder: (BuildContext context, state) {
            debugPrint('state: ${state.runtimeType}');

            if (state is SpacexInitialState || state is SpacexLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is SpacexErrorState) {
              debugPrint('error : ${state.message}');
              return Text('Getting Error: ${state.message}');
            } else if (state is SpacexLoadedState) {
              return _LaunchDetailCard(size: size, state: state);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _LaunchDetailCard extends StatelessWidget {
  const _LaunchDetailCard({Key? key, required this.size, required this.state})
      : super(key: key);

  final Size size;
  final SpacexLoadedState state;

  @override
  Widget build(BuildContext context) {
    print(state.spacexModel.links.webcast);
    print(state.spacexModel.links.reddit.launch);
    print(state.spacexModel.details);
    print(state.spacexModel.links.flickr.original.length);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: state.spacexModel.crew.length,
          itemBuilder: (context, index) {
            final crewMember = state.spacexModel.crew[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.network(state.spacexModel.links.patch.large,
                      width: 170, height: 170),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        state.spacexModel.name, // modelname,
                      ),
                      Text(state.spacexModel.dateLocal.toString()),
                      Text(state.spacexModel.dateUtc.toString()),
                      Text(state.spacexModel.links.webcast),
                      Text(state.spacexModel.links.patch.small),
                      Text(state.spacexModel.links.reddit.launch),
                      //Text(state.spacexModel.links.reddit.media), // null
                      //Text(state.spacexModel.launch.toString()), // null
                      //Text(state.spacexModel.links.flickr.original[index])
                      Text("Crew Member: $crewMember"),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
