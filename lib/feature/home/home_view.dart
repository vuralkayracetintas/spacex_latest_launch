import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_latest_launch/bloc/spacex_bloc.dart';
import 'package:spacex_latest_launch/bloc/spacex_events.dart';
import 'package:spacex_latest_launch/bloc/spacex_states.dart';
import 'package:spacex_latest_launch/product/repository/spacex_repositorty.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: size.width * .9,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.network(state.spacexModel.links.patch.small,
                      width: 170, height: 170),
                ),
                Center(
                  child: Text(
                    state.spacexModel.name,
                    style: const TextStyle(
                      fontSize: 20,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (state.spacexModel.details != null)
                  Text(state.spacexModel.details!),
                if (state.spacexModel.links.flickr.original.isNotEmpty)
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final url =
                            state.spacexModel.links.flickr.original[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(url, fit: BoxFit.cover),
                        );
                      },
                      itemCount: state.spacexModel.links.flickr.original.length,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
